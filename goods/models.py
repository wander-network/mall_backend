from django.db import models

# Create your models here.
from django.db import models


class Category(models.Model):
    """商品分类"""
    name = models.CharField(max_length=50, verbose_name="分类名称")
    parent = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True, related_name='children',
                               verbose_name="父分类")
    icon = models.ImageField(upload_to='categories/', blank=True, null=True, verbose_name="图标")
    order = models.IntegerField(default=0, verbose_name="排序")

    class Meta:
        verbose_name = "分类"
        verbose_name_plural = "分类"
        ordering = ['order', 'id']

    def __str__(self):
        return self.name


class Brand(models.Model):
    """品牌"""
    name = models.CharField(max_length=50, verbose_name="品牌名称")
    logo = models.ImageField(upload_to='brands/', blank=True, null=True, verbose_name="Logo")

    class Meta:
        verbose_name = "品牌"
        verbose_name_plural = "品牌"

    def __str__(self):
        return self.name


class Product(models.Model):
    """商品"""
    name = models.CharField(max_length=200, verbose_name="商品名称")
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='products', verbose_name="分类")
    brand = models.ForeignKey(Brand, on_delete=models.SET_NULL, null=True, blank=True, verbose_name="品牌")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="售价")
    original_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="原价")
    stock = models.PositiveIntegerField(default=0, verbose_name="库存")
    sales = models.PositiveIntegerField(default=0, verbose_name="销量")
    views = models.PositiveIntegerField(default=0, verbose_name="浏览量")
    description = models.TextField(verbose_name="商品描述")
    is_hot = models.BooleanField(default=False, verbose_name="是否热门")
    is_new = models.BooleanField(default=False, verbose_name="是否新品")
    is_published = models.BooleanField(default=True, verbose_name="是否上架")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = "商品"
        verbose_name_plural = "商品"
        ordering = ['-created_at']

    def __str__(self):
        return self.name


class ProductImage(models.Model):
    """商品图片"""
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='images', verbose_name="商品")
    image = models.ImageField(upload_to='products/%Y/%m/', verbose_name="图片")
    is_main = models.BooleanField(default=False, verbose_name="是否主图")
    order = models.IntegerField(default=0, verbose_name="排序")

    class Meta:
        verbose_name = "商品图片"
        verbose_name_plural = "商品图片"
        ordering = ['order', '-is_main']

    def __str__(self):
        return f"{self.product.name} - 图片"


class SKU(models.Model):
    """商品规格（SKU）"""
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='skus', verbose_name="商品")
    spec_name = models.CharField(max_length=50, verbose_name="规格名")
    spec_value = models.CharField(max_length=50, verbose_name="规格值")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="价格")
    stock = models.PositiveIntegerField(default=0, verbose_name="库存")

    class Meta:
        verbose_name = "SKU"
        verbose_name_plural = "SKU"

    def __str__(self):
        return f"{self.product.name} - {self.spec_name}:{self.spec_value}"