from django.db import models

# Create your models here.
import uuid
from django.db import models
from django.conf import settings
from goods.models import Product, SKU
from users.models import Address


class Order(models.Model):
    """订单"""
    STATUS_CHOICES = [
        ('pending', '待支付'),
        ('paid', '已支付'),
        ('shipped', '已发货'),
        ('received', '已收货'),
        ('cancelled', '已取消'),
        ('refunded', '已退款'),
    ]

    order_no = models.CharField(max_length=32, unique=True, verbose_name="订单号")
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='orders')
    address = models.ForeignKey(Address, on_delete=models.CASCADE, verbose_name="收货地址")
    total_amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="订单总金额")
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending', verbose_name="订单状态")
    remark = models.TextField(blank=True, verbose_name="订单备注")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    paid_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        verbose_name = "订单"
        verbose_name_plural = "订单"
        ordering = ['-created_at']

    def __str__(self):
        return self.order_no

    def save(self, *args, **kwargs):
        if not self.order_no:
            self.order_no = f"{self.user.id}{timezone.now().strftime('%Y%m%d%H%M%S')}{uuid.uuid4().hex[:6]}"
        super().save(*args, **kwargs)


class OrderItem(models.Model):
    """订单项"""
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name='items', verbose_name="订单")
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name="商品")
    sku = models.ForeignKey(SKU, on_delete=models.CASCADE, null=True, blank=True, verbose_name="规格")
    product_name = models.CharField(max_length=200, verbose_name="商品名称")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="单价")
    quantity = models.PositiveIntegerField(default=1, verbose_name="数量")
    total_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="小计")

    def __str__(self):
        return f"{self.order.order_no} - {self.product_name}"