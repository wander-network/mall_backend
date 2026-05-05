from django.db import models

# Create your models here.
from django.db import models
from django.conf import settings
from goods.models import Product


class Favorite(models.Model):
    """商品收藏"""
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='favorites')
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='favorites')
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "收藏"
        verbose_name_plural = "收藏"
        unique_together = ['user', 'product']

    def __str__(self):
        return f"{self.user.username} - {self.product.name}"