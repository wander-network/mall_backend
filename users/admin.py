from django.contrib import admin

# Register your models here.
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User, Address

@admin.register(User)
class CustomUserAdmin(UserAdmin):
    list_display = ['username', 'email', 'phone', 'is_staff']
    fieldsets = UserAdmin.fieldsets + (
        ('额外信息', {'fields': ('phone', 'avatar')}),
    )

@admin.register(Address)
class AddressAdmin(admin.ModelAdmin):
    list_display = ['user', 'receiver_name', 'receiver_phone', 'is_default']
    list_filter = ['is_default']