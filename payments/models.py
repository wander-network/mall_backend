# Create your models here.
from django.db import models
from orders.models import Order


class Payment(models.Model):
    """支付记录"""
    PAYMENT_METHODS = [
        ('alipay', '支付宝'),
        ('wechat', '微信支付'),
    ]
    STATUS_CHOICES = [
        ('pending', '待支付'),
        ('success', '支付成功'),
        ('failed', '支付失败'),
    ]

    order = models.OneToOneField(Order, on_delete=models.CASCADE, related_name='payment')
    payment_no = models.CharField(max_length=64, unique=True, verbose_name="支付流水号")
    amount = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="支付金额")
    payment_method = models.CharField(max_length=20, choices=PAYMENT_METHODS, verbose_name="支付方式")
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending', verbose_name="支付状态")
    created_at = models.DateTimeField(auto_now_add=True)
    paid_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        verbose_name = "支付记录"
        verbose_name_plural = "支付记录"

    def __str__(self):
        return f"{self.order.order_no} - {self.amount}"