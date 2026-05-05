from django.shortcuts import render

# Create your views here.
import uuid
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.shortcuts import get_object_or_404
from django.utils import timezone
from orders.models import Order
from .models import Payment
from .serializers import PaymentSerializer, CreatePaymentSerializer


class CreatePaymentView(generics.CreateAPIView):
    serializer_class = CreatePaymentSerializer
    permission_classes = [IsAuthenticated]

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        order = get_object_or_404(Order, id=serializer.validated_data['order_id'], user=request.user)

        if order.status != 'pending':
            return Response({'error': '订单状态不正确，无法支付'}, status=status.HTTP_400_BAD_REQUEST)

        # 创建支付记录
        payment = Payment.objects.create(
            order=order,
            payment_no=uuid.uuid4().hex.upper(),
            amount=order.total_amount,
            payment_method=serializer.validated_data['payment_method']
        )

        # 模拟支付成功（实际需要对接支付宝/微信接口）
        payment.status = 'success'
        payment.paid_at = timezone.now()
        payment.save()

        # 更新订单状态
        order.status = 'paid'
        order.paid_at = timezone.now()
        order.save()

        return Response(PaymentSerializer(payment).data, status=status.HTTP_201_CREATED)


class PaymentCallbackView(generics.GenericAPIView):
    """支付回调（模拟）"""
    permission_classes = []

    def post(self, request, *args, **kwargs):
        # 实际项目中需要验证签名、处理回调数据
        payment_no = request.data.get('payment_no')
        if payment_no:
            payment = get_object_or_404(Payment, payment_no=payment_no)
            if payment.status == 'pending':
                payment.status = 'success'
                payment.paid_at = timezone.now()
                payment.save()

                payment.order.status = 'paid'
                payment.order.paid_at = timezone.now()
                payment.order.save()

        return Response({'code': 'SUCCESS'})