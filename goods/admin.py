from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Category, Brand, Product, ProductImage, SKU

class ProductImageInline(admin.TabularInline):
    model = ProductImage
    extra = 1

class SKUInline(admin.TabularInline):
    model = SKU
    extra = 1

@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'parent', 'order']
    list_filter = ['parent']

@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    list_display = ['name']

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ['name', 'category', 'brand', 'price', 'stock', 'sales', 'is_published']
    list_filter = ['category', 'brand', 'is_hot', 'is_new', 'is_published']
    search_fields = ['name']
    inlines = [ProductImageInline, SKUInline]