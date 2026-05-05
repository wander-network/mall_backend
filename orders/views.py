from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import action
from django.shortcuts import get_object_or_404
from django.db import transaction
from users.models import Address
from cart.models import CartItem
from goods.models import Product
from .models import Order, OrderItem
from .serializers import OrderSerializer, CreateOrderSerializer


class OrderViewSet(viewsets.ModelViewSet):
    serializer_class = OrderSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        queryset = Order.objects.filter(user=self.request.user)
        status_filter = self.request.query_params.get('status')
        if status_filter:
            queryset = queryset.filter(status=status_filter)
        return queryset

    @transaction.atomic
    def create(self, request, *args, **kwargs):
        serializer = CreateOrderSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        # 获取地址
        address = get_object_or_404(Address, id=serializer.validated_data['address_id'], user=request.user)

        # 获取购物车商品
        cart_items = CartItem.objects.filter(
            id__in=serializer.validated_data['cart_item_ids'],
            user=request.user
        )

        if not cart_items.exists():
            return Response({'error': '购物车为空'}, status=status.HTTP_400_BAD_REQUEST)

        # 计算总金额并检查库存
        total_amount = 0
        order_items_data = []

        for cart_item in cart_items:
            product = cart_item.product
            quantity = cart_item.quantity

            # 检查库存
            if product.stock < quantity:
                return Response({'error': f'{product.name} 库存不足'}, status=status.HTTP_400_BAD_REQUEST)

            price = cart_item.sku.price if cart_item.sku else product.price
            total_price = price * quantity
            total_amount += total_price

            order_items_data.append({
                'product': product,
                'sku': cart_item.sku,
                'product_name': product.name,
                'price': price,
                'quantity': quantity,
                'total_price': total_price,
            })

        # 创建订单
        order = Order.objects.create(
            user=request.user,
            address=address,
            total_amount=total_amount,
            remark=serializer.validated_data.get('remark', '')
        )

        # 创建订单项并扣减库存
        for item_data in order_items_data:
            OrderItem.objects.create(order=order, **item_data)
            product = item_data['product']
            product.stock -= item_data['quantity']
            product.sales += item_data['quantity']
            product.save()

        # 删除购物车商品
        cart_items.delete()

        return Response(OrderSerializer(order).data, status=status.HTTP_201_CREATED)

    @action(detail=True, methods=['post'])
    def cancel(self, request, pk=None):
        """取消订单"""
        order = self.get_object()
        if order.status != 'pending':
            return Response({'error': '只能取消待支付的订单'}, status=status.HTTP_400_BAD_REQUEST)

        with transaction.atomic():
            order.status = 'cancelled'
            order.save()

            # 恢复库存
            for item in order.items.all():
                product = item.product
                product.stock += item.quantity
                product.sales -= item.quantity
                product.save()

        return Response({'message': '订单已取消'})

    @action(detail=True, methods=['post'])
    def confirm(self, request, pk=None):
        """确认收货"""
        order = self.get_object()
        if order.status != 'shipped':
            return Response({'error': '只能确认已发货的订单'}, status=status.HTTP_400_BAD_REQUEST)

        order.status = 'received'
        order.save()
        return Response({'message': '已确认收货'})