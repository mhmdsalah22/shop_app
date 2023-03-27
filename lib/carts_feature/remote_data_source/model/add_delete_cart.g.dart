// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_delete_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDeleteCart _$AddDeleteCartFromJson(Map<String, dynamic> json) =>
    AddDeleteCart(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddDeleteCartToJson(AddDeleteCart instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      price: json['price'],
      old_price: json['old_price'],
      discount: json['discount'],
      image: json['image'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.old_price,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
    };
