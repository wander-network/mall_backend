from rest_framework import serializers
from .models import Category, Brand, Product, ProductImage, SKU


class CategorySerializer(serializers.ModelSerializer):
    children = serializers.SerializerMethodField()

    class Meta:
        model = Category
        fields = ['id', 'name', 'icon', 'children']

    def get_children(self, obj):
        if obj.children.exists():
            return CategorySerializer(obj.children.all(), many=True).data
        return []


class BrandSerializer(serializers.ModelSerializer):
    class Meta:
        model = Brand
        fields = '__all__'


class ProductImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductImage
        fields = ['id', 'image', 'is_main', 'order']


class SKUSerializer(serializers.ModelSerializer):
    class Meta:
        model = SKU
        fields = ['id', 'spec_name', 'spec_value', 'price', 'stock']


class ProductListSerializer(serializers.ModelSerializer):
    category = CategorySerializer(read_only=True)
    main_image = serializers.SerializerMethodField()

    class Meta:
        model = Product
        fields = ['id', 'name', 'price', 'original_price', 'category', 'main_image', 'sales', 'stock', 'is_hot']

    def get_main_image(self, obj):
        main_img = obj.images.filter(is_main=True).first()
        if main_img:
            return main_img.image.url
        return None


class ProductDetailSerializer(serializers.ModelSerializer):
    category = CategorySerializer(read_only=True)
    brand = BrandSerializer(read_only=True)
    images = ProductImageSerializer(many=True, read_only=True)
    skus = SKUSerializer(many=True, read_only=True)

    class Meta:
        model = Product
        fields = '__all__'