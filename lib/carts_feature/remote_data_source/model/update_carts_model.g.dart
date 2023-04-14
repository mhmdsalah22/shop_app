// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_carts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartsModel _$UpdateCartsModelFromJson(Map<String, dynamic> json) =>
    UpdateCartsModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: DataBean.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateCartsModelToJson(UpdateCartsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) => DataBean(
      cart: CartModel.fromJson(json['cart'] as Map<String, dynamic>),
      sub_total: json['sub_total'] as num,
      total: json['total'] as num,
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'cart': instance.cart,
      'sub_total': instance.sub_total,
      'total': instance.total,
    };

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      price: json['price'] as num,
      old_price: json['old_price'] as num,
      discount: json['discount'] as num,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.old_price,
      'discount': instance.discount,
      'image': instance.image,
    };
