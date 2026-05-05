from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Favorite


@admin.register(Favorite)
class FavoriteAdmin(admin.ModelAdmin):
    list_display = ['user', 'product', 'created_at']
    list_filter = ['user']