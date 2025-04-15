from django.db import models

# Create your models here.

class Client(models.Model):
    name = models.CharField(max_length=100)
    contact = models.CharField(max_length=20)

    def __str__(self):
        return self.name

    def calculate_trust_rating(self):
        # Placeholder for the actual regression model or calculation logic.
        # This should use the client's loan history to predict the trust rating.

        # Get the client's loan data (you may need a method that fetches this)
        loan_data = self.loans.all()  # Assuming you have a related name set for Loan
        features = []
        target = []

        # Example of collecting features from loans (loan amount, duration, etc.)
        for loan in loan_data:
            features.append([loan.amount, loan.payment_duration])  # Replace with your actual features
            target.append(loan.status)  # This could be something like loan repayment status (Paid, Ongoing, etc.)

        # Apply your linear regression model or calculation here
        # For simplicity, let's say we're using a pre-trained model (not shown here)

        # Sample logic, replace with actual regression or model prediction
        prediction = 85  # Dummy trust rating, replace with actual prediction logic

        return prediction
class Loan(models.Model):
    client = models.ForeignKey(Client, on_delete=models.CASCADE, related_name='loans')
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    payment_duration = models.IntegerField()  # Number of months (6, 12, 18, etc.)
    interest_rate = models.DecimalField(max_digits=5, decimal_places=2)  # Percentage
    status = models.CharField(max_length=20, 
        choices=[('Ongoing', 'Ongoing'), ('Paid', 'Paid'), ('Overdue', 'Overdue')],
        default='Ongoing')
    date_issued = models.DateField()
    
    
    def __str__(self):
        return f"{self.client.name} - {self.amount}"
    
    def calculate_total_repayment(self):
        # Basic formula for calculating total repayment with interest
        interest = (self.amount * self.interest_rate / 100)  # Interest in percentage
        total_repayment = self.amount + interest  # Total repayment
        return total_repayment

    def calculate_monthly_payment(self):
        total_repayment = self.calculate_total_repayment()
        monthly_payment = total_repayment / self.payment_duration
        return monthly_payment