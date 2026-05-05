from rest_framework import serializers
from .models import Order, OrderItem
from cart.models import CartItem
from goods.models import Product


class OrderItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderItem
        fields = ['id', 'product_name', 'price', 'quantity', 'total_price']


class OrderSerializer(serializers.ModelSerializer):
    items = OrderItemSerializer(many=True, read_only=True)

    class Meta:
        model = Order
        fields = '__all__'
        read_only_fields = ['order_no', 'user', 'total_amount', 'status', 'created_at']


class CreateOrderSerializer(serializers.Serializer):
    address_id = serializers.IntegerField()
    cart_item_ids = serializers.ListField(child=serializers.IntegerField())
    remark = serializers.CharField(required=False, allow_blank=True)