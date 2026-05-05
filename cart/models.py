from django.db import models

# Create your models here.
from django.db import models
from django.conf import settings
from goods.models import Product, SKU


class CartItem(models.Model):
    """购物车项"""
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='cart_items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name="商品")
    sku = models.ForeignKey(SKU, on_delete=models.CASCADE, null=True, blank=True, verbose_name="规格")
    quantity = models.PositiveIntegerField(default=1, verbose_name="数量")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "购物车"
        verbose_name_plural = "购物车"
        unique_together = ['user', 'product', 'sku']

    def __str__(self):
        return f"{self.user.username} - {self.product.name}"

    @property
    def total_price(self):
        price = self.sku.price if self.sku else self.product.price
        return price * self.quantity