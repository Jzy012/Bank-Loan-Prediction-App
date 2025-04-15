from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponse, JsonResponse
from .models import Client, Loan
from .forms import ClientForm, LoanForm
from django.utils import timezone
import pandas as pd
import joblib   



from decimal import Decimal

def calculate_trust_rating(loan_amount, loan_duration, interest_rate, loan_status):
    # Convert all input values to Decimal to ensure consistency
    loan_amount = Decimal(loan_amount)
    loan_duration = Decimal(loan_duration)
    interest_rate = Decimal(interest_rate)
    
    # Base trust rating
    trust_rating = Decimal(100)
    
    # Penalize based on loan amount (higher amount, lower trust rating)
    trust_rating -= loan_amount / Decimal(1000)  # Scale down the loan amount
    
    # Penalize based on loan duration (longer duration, lower trust rating)
    trust_rating -= (loan_duration - Decimal(12)) / Decimal(6)  # Assume 12 months as a baseline
    
    # Penalize based on interest rate (higher interest rate, lower trust rating)
    trust_rating -= (interest_rate - Decimal(5)) * Decimal(2)  # Assume 5% as the baseline rate
    
    # Adjust based on loan status
    if loan_status == 'Paid':
        trust_rating += Decimal(10)  # Bonus for paid loans
    elif loan_status == 'Ongoing':
        trust_rating -= Decimal(5)  # Penalty for ongoing loans
    elif loan_status == 'Overdue':
        trust_rating -= Decimal(15)  # Larger penalty for overdue loans
    
    # Ensure the trust rating stays within the 0-100 range
    trust_rating = max(Decimal(0), min(trust_rating, Decimal(100)))
    
    return trust_rating

def home(request):
    clients = Client.objects.all()

    if request.method == "POST":
        client_id = request.POST.get("client_id")
        
        # Only try to fetch the client if an ID was provided
        if client_id:
            client = Client.objects.get(id=client_id)
            
            # Calculate trust rating based on the most recent loan
            # Fetch the latest loan for this client
            latest_loan = client.loans.all().order_by('-date_issued').first()
            
            if latest_loan:
                # Extract loan details
                amount = latest_loan.amount
                payment_duration = latest_loan.payment_duration
                interest_rate = latest_loan.interest_rate
                status = latest_loan.status
                
                # Calculate trust rating
                trust_rating = calculate_trust_rating(amount, payment_duration, interest_rate, status)
                eligible = trust_rating >= 80  # Eligibility based on trust rating

                # ✅ Fetch the loan history
                loan_history = client.loans.all().order_by('-date_issued')  # You used related_name='loans'

                context = {
                    'clients': clients,
                    'client': client,
                    'trust_rating': trust_rating,
                    'eligible': eligible,
                    'assessment': 'Eligible for Loan' if eligible else 'Not Eligible for Loan',
                    'loan_history': loan_history,  # Pass the loan history to the template
                }
                return render(request, 'home.html', context)

    # If no client is selected or it's a GET request
    return render(request, 'home.html', {'clients': clients})



def loan_create(request, client_id):
    # Fetch the client (you can pass the client id via URL, query string, etc.)
    client = Client.objects.get(id=client_id)

    if request.method == 'POST':
        form = LoanForm(request.POST)
        if form.is_valid():
            # Save the loan application
            loan = form.save(commit=False)
            loan.client = client  # Link loan to the client
            loan.date_issued = timezone.now()  # Set the date issued to now
            loan.save()

            # Update the client's trust rating after the loan is saved
            client = Client.objects.get(id=client_id)  # Re-fetch client
            client.trust_rating = calculate_new_trust_rating(client)
            client.save()

            # Redirect to the loan success page or another page
            return redirect('home')  # Adjust the redirect as needed
    else:
        form = LoanForm()

    return render(request, 'loan_create.html', {'form': form, 'client': client})

def loan_update(request, loan_id):
    loan = get_object_or_404(Loan, id=loan_id)
    
    if request.method == 'POST':
        new_status = request.POST.get('status')
        if new_status in ['Ongoing', 'Paid', 'Overdue']:  # Ensure valid status
            loan.status = new_status
            loan.save()
            return redirect('home')  # Redirect back to the home page after updating the status
    
    return render(request, 'update_loan_status.html', {'loan': loan})

def calculate_new_trust_rating(client):
    # Logic to calculate the new trust rating based on the loan history
    total_loans = client.loans.all()
    total_paid_loans = total_loans.filter(status='Paid').count()
    total_loans_count = total_loans.count()

    # Example formula: Adjust trust rating based on the ratio of paid loans
    if total_loans_count > 0:
        new_trust_rating = (total_paid_loans / total_loans_count) * 100
    else:
        new_trust_rating = 50  # Default trust rating if no loans

    return new_trust_rating

