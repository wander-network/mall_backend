from rest_framework import serializers
from .models import CartItem
from goods.serializers import ProductListSerializer, SKUSerializer


class CartItemSerializer(serializers.ModelSerializer):
    product = ProductListSerializer(read_only=True)
    sku = SKUSerializer(read_only=True)
    total_price = serializers.DecimalField(max_digits=10, decimal_places=2, read_only=True)

    class Meta:
        model = CartItem
        fields = ['id', 'product', 'sku', 'quantity', 'total_price', 'created_at']


class AddToCartSerializer(serializers.Serializer):
    product_id = serializers.IntegerField()
    sku_id = serializers.IntegerField(required=False, allow_null=True)
    quantity = serializers.IntegerField(min_value=1, default=1)


class UpdateCartSerializer(serializers.Serializer):
    quantity = serializers.IntegerField(min_value=1)