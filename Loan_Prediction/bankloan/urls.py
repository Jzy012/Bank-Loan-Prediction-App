from django.urls import path
from .import views


urlpatterns = [
    path('', views.home, name='home'),
    path('create/<int:client_id>', views.loan_create, name='loan_create'),
    path('update/<int:loan_id>', views.loan_update, name='loan_update'),
]