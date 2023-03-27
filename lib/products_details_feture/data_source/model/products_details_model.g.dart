// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsDetailsModel _$ProductsDetailsModelFromJson(
        Map<String, dynamic> json) =>
    ProductsDetailsModel(
      status: json['status'] as bool,
      message: json['message'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsDetailsModelToJson(
        ProductsDetailsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int,
      price: json['price'] as num,
      old_price: json['old_price'] as num,
      discount: json['discount'] as num,
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      in_favorites: json['in_favorites'] as bool,
      in_cart: json['in_cart'] as bool,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.old_price,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'in_favorites': instance.in_favorites,
      'in_cart': instance.in_cart,
      'images': instance.images,
    };
