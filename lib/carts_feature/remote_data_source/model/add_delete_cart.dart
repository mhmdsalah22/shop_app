import 'package:json_annotation/json_annotation.dart';

part 'add_delete_cart.g.dart';

@JsonSerializable()
class AddProductTOCart {
  bool status;
  String? message;
  Data data;

  AddProductTOCart(
      {required this.status, required this.message, required this.data});

  factory AddProductTOCart.fromJson(Map<String, dynamic> json) =>
      _$AddProductTOCartFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductTOCartToJson(this);
}

@JsonSerializable()
class Data {
  int id;
  int quantity;
  Product product;

  Data({required this.id, required this.quantity, required this.product});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Product {
  int id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String? image;
  String? name;
  String? description;

  Product(
      {required this.id,
      required this.price,
      required this.old_price,
      required this.discount,
      required this.image,
      required this.name,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
