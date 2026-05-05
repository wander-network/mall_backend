from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, status, generics
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.shortcuts import get_object_or_404
from .models import CartItem
from goods.models import Product, SKU
from .serializers import CartItemSerializer, AddToCartSerializer, UpdateCartSerializer


class CartViewSet(viewsets.ModelViewSet):
    serializer_class = CartItemSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return CartItem.objects.filter(user=self.request.user)

    def create(self, request, *args, **kwargs):
        serializer = AddToCartSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        product = get_object_or_404(Product, id=serializer.validated_data['product_id'])
        sku_id = serializer.validated_data.get('sku_id')
        quantity = serializer.validated_data['quantity']

        # 检查库存
        if sku_id:
            sku = get_object_or_404(SKU, id=sku_id, product=product)
            if sku.stock < quantity:
                return Response({'error': '库存不足'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            if product.stock < quantity:
                return Response({'error': '库存不足'}, status=status.HTTP_400_BAD_REQUEST)

        cart_item, created = CartItem.objects.get_or_create(
            user=request.user,
            product=product,
            sku_id=sku_id,
            defaults={'quantity': quantity}
        )
        if not created:
            cart_item.quantity += quantity
            cart_item.save()

        return Response(CartItemSerializer(cart_item).data, status=status.HTTP_201_CREATED)

    def update(self, request, *args, **kwargs):
        cart_item = self.get_object()
        serializer = UpdateCartSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        cart_item.quantity = serializer.validated_data['quantity']
        cart_item.save()

        return Response(CartItemSerializer(cart_item).data)