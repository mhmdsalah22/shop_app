// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favorites _$FavoritesFromJson(Map<String, dynamic> json) => Favorites(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoritesToJson(Favorites instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      current_page: json['current_page'] as num,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
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

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      price: json['price'] as num,
      old_price: json['old_price'] as num,
      discount: json['discount'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
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
