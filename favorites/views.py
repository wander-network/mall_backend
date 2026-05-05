from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import action
from django.shortcuts import get_object_or_404
from goods.models import Product
from .models import Favorite
from .serializers import FavoriteSerializer, AddFavoriteSerializer


class FavoriteViewSet(viewsets.ModelViewSet):
    serializer_class = FavoriteSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return Favorite.objects.filter(user=self.request.user)

    def create(self, request, *args, **kwargs):
        serializer = AddFavoriteSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        product = get_object_or_404(Product, id=serializer.validated_data['product_id'])
        favorite, created = Favorite.objects.get_or_create(user=request.user, product=product)

        if not created:
            return Response({'message': '已经收藏过了'}, status=status.HTTP_400_BAD_REQUEST)

        return Response(FavoriteSerializer(favorite).data, status=status.HTTP_201_CREATED)