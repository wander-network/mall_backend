from rest_framework import serializers
from .models import Payment


class PaymentSerializer(serializers.ModelSerializer):
    """支付记录序列化器（返回给前端）"""

    class Meta:
        model = Payment
        fields = ['id', 'payment_no', 'amount', 'payment_method', 'status', 'created_at']
        read_only_fields = ['payment_no', 'status', 'created_at']


class CreatePaymentSerializer(serializers.Serializer):
    """创建支付请求序列化器（前端发送）"""
    order_id = serializers.IntegerField(
        label="订单ID",
        help_text="需要支付的订单ID"
    )
    payment_method = serializers.ChoiceField(
        choices=['alipay', 'wechat'],
        label="支付方式",
        help_text="alipay: 支付宝, wechat: 微信支付"
    )