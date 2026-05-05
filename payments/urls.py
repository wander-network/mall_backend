from django.urls import path
from . import views

urlpatterns = [
    path('payments/', views.CreatePaymentView.as_view(), name='create_payment'),
    path('payments/callback/', views.PaymentCallbackView.as_view(), name='payment_callback'),
]