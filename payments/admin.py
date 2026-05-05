# Register your models here.
from django.contrib import admin
from .models import Payment


@admin.register(Payment)
class PaymentAdmin(admin.ModelAdmin):
    list_display = ['payment_no', 'order', 'amount', 'payment_method', 'status', 'created_at']
    list_filter = ['status', 'payment_method']