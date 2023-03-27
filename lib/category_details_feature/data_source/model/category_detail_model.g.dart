// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDetailModel _$CategoryDetailModelFromJson(Map<String, dynamic> json) =>
    CategoryDetailModel(
      status: json['status'] as bool,
      message: json['message'],
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryDetailModelToJson(
        CategoryDetailModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      current_page: json['current_page'] as num,
      data: (json['data'] as List<dynamic>)
          .map((e) => DataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      first_page_url: json['first_page_url'] as String,
      from: json['from'] as num,
      last_page: json['last_page'] as num,
      last_page_url: json['last_page_url'] as String,
      next_page_url: json['next_page_url'],
      path: json['path'] as String,
      per_page: json['per_page'] as num,
      prev_page_url: json['prev_page_url'],
      to: json['to'] as num,
      total: json['total'] as num,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'data': instance.data,
      'first_page_url': instance.first_page_url,
      'from': instance.from,
      'last_page': instance.last_page,
      'last_page_url': instance.last_page_url,
      'next_page_url': instance.next_page_url,
      'path': instance.path,
      'per_page': instance.per_page,
      'prev_page_url': instance.prev_page_url,
      'to': instance.to,
      'total': instance.total,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
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

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
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
