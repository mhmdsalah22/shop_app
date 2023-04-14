// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_carts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartsModel _$GetCartsModelFromJson(Map<String, dynamic> json) =>
    GetCartsModel(
      status: json['status'] as bool,
      message: json['message'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCartsModelToJson(GetCartsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      cart_items: (json['cart_items'] as List<dynamic>)
          .map((e) => Cart_items.fromJson(e as Map<String, dynamic>))
          .toList(),
      sub_total: json['sub_total'] as num,
      total: json['total'] as num,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'cart_items': instance.cart_items,
      'sub_total': instance.sub_total,
      'total': instance.total,
    };

Cart_items _$Cart_itemsFromJson(Map<String, dynamic> json) => Cart_items(
      id: json['id'] as int,
      quantity: json['quantity'] as int,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Cart_itemsToJson(Cart_items instance) =>
    <String, dynamic>{
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
      name: json['name'] as String,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      in_favorites: json['in_favorites'] as bool,
      in_cart: json['in_cart'] as bool,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.old_price,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'in_favorites': instance.in_favorites,
      'in_cart': instance.in_cart,
    };
