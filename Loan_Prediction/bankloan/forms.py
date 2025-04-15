from django import forms
from .models import Client, Loan





class ClientForm(forms.Form):
    client = forms.ModelChoiceField(queryset=Client.objects.all(), empty_label="Select a client")
    

class LoanForm(forms.ModelForm):
    class Meta:
        model = Loan
        fields = ['amount', 'payment_duration', 'interest_rate']
        widgets = {
    'amount': forms.NumberInput(attrs={
        'class': 'w-44 px-2 py-1 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 mb-4',
        'placeholder': 'Enter amount' ,  'id': 'amount'
    }),
    'payment_duration': forms.Select(
        choices=[
            (6, '6 months'), (12, '12 months'), (18, '18 months'),
            (24, '24 months'), (36, '36 months')
           
        ],
        attrs={
            'class': 'w-44 px-2 py-1 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 mb-4' ,  'id': 'payment_duration'
        }
    ),
    'interest_rate': forms.NumberInput(attrs={
        'class': 'w-44 px-2 py-1 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 mb-4',
        'placeholder': 'Enter interest rate (%)' ,  'id': 'interest_rate'
    }),
}




    # You can add custom validation or additional fields here if needed
