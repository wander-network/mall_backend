from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, filters, generics
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.decorators import action
from rest_framework.response import Response
from django.core.cache import cache
from .models import Category, Brand, Product
from .serializers import CategorySerializer, BrandSerializer, ProductListSerializer, ProductDetailSerializer


class CategoryViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Category.objects.filter(parent=None)
    serializer_class = CategorySerializer


class BrandViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Brand.objects.all()
    serializer_class = BrandSerializer


class ProductViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = Product.objects.filter(is_published=True)
    filter_backends = [DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter]
    filterset_fields = ['category', 'brand', 'is_hot', 'is_new']
    search_fields = ['name', 'description']
    ordering_fields = ['price', 'sales', 'created_at']
    ordering = ['-created_at']

    def get_serializer_class(self):
        if self.action == 'list':
            return ProductListSerializer
        return ProductDetailSerializer

    def retrieve(self, request, *args, **kwargs):
        # 缓存商品详情
        cache_key = f'product_detail_{kwargs["pk"]}'
        cached_data = cache.get(cache_key)
        if cached_data:
            return Response(cached_data)

        response = super().retrieve(request, *args, **kwargs)
        cache.set(cache_key, response.data, 60 * 30)  # 缓存30分钟

        # 增加浏览量
        product = self.get_object()
        product.views += 1
        product.save(update_fields=['views'])

        return response

    @action(detail=False, methods=['get'])
    def hot(self, request):
        """热门商品"""
        products = Product.objects.filter(is_published=True, is_hot=True)[:10]
        serializer = self.get_serializer(products, many=True)
        return Response(serializer.data)

    @action(detail=False, methods=['get'])
    def new(self, request):
        """新品推荐"""
        products = Product.objects.filter(is_published=True, is_new=True)[:10]
        serializer = self.get_serializer(products, many=True)
        return Response(serializer.data)