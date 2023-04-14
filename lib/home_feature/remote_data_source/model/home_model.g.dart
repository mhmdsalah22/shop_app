// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      status: json['status'] as bool,
      message: json['message'],
      data: DataBean.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) => DataBean(
      banners: (json['banners'] as List<dynamic>)
          .map((e) => BannersBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductsBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      ad: json['ad'] as String,
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'banners': instance.banners,
      'products': instance.products,
      'ad': instance.ad,
    };

ProductsBean _$ProductsBeanFromJson(Map<String, dynamic> json) => ProductsBean(
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

Map<String, dynamic> _$ProductsBeanToJson(ProductsBean instance) =>
    <String, dynamic>{
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

BannersBean _$BannersBeanFromJson(Map<String, dynamic> json) => BannersBean(
      id: json['id'] as int,
      image: json['image'] as String,
      category: json['category'],
      product: json['product'],
    );

Map<String, dynamic> _$BannersBeanToJson(BannersBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'category': instance.category,
      'product': instance.product,
    };
