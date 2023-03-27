import 'package:json_annotation/json_annotation.dart';

part 'get_carts_model.g.dart';

@JsonSerializable()
class GetCartsModel {
  bool status;
  dynamic message;
  Data data;

  GetCartsModel({required this.status, required this.message, required this.data});

  factory GetCartsModel.fromJson(Map<String, dynamic> json) => _$GetCartsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartsModelToJson(this);
}

@JsonSerializable()
class Data {
  List<Cart_items> cart_items;
  num sub_total;
  num total;

  Data({required this.cart_items, required this.sub_total, required this.total});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Cart_items {
  int id;
  num quantity;
  Product product;

  Cart_items({ required this.id, required this.quantity, required this.product});

  factory Cart_items.fromJson(Map<String, dynamic> json) => _$Cart_itemsFromJson(json);

  Map<String, dynamic> toJson() => _$Cart_itemsToJson(this);
}

@JsonSerializable()
class Product {
  int id;
  num price;
  num old_price;
  num discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool in_favorites;
  bool in_cart;

  Product({ required this.id, required this.price, required this.old_price, required this.discount, required this.image, required this.name, required
   this.description,required  this.images, required this.in_favorites, required this.in_cart});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

