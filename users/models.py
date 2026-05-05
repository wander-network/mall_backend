from django.db import models

# Create your models here.
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils import timezone


class User(AbstractUser):
    """自定义用户模型"""
    phone = models.CharField(max_length=11, blank=True, verbose_name="手机号")
    avatar = models.ImageField(upload_to='avatars/%Y/%m/', blank=True, null=True, verbose_name="头像")

    class Meta:
        verbose_name = "用户"
        verbose_name_plural = "用户"

    def __str__(self):
        return self.username


class Address(models.Model):
    """收货地址"""
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='addresses', verbose_name="用户")
    receiver_name = models.CharField(max_length=50, verbose_name="收货人")
    receiver_phone = models.CharField(max_length=11, verbose_name="联系电话")
    province = models.CharField(max_length=50, verbose_name="省")
    city = models.CharField(max_length=50, verbose_name="市")
    district = models.CharField(max_length=50, verbose_name="区")
    detail = models.CharField(max_length=200, verbose_name="详细地址")
    is_default = models.BooleanField(default=False, verbose_name="是否默认")
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "地址"
        verbose_name_plural = "地址"
        ordering = ['-is_default', '-created_at']

    def __str__(self):
        return f"{self.receiver_name} - {self.receiver_phone}"

    def save(self, *args, **kwargs):
        if self.is_default:
            Address.objects.filter(user=self.user).update(is_default=False)
        super().save(*args, **kwargs)