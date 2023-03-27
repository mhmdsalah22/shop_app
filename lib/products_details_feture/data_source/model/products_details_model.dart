import 'package:json_annotation/json_annotation.dart';

part 'products_details_model.g.dart';

@JsonSerializable()
class ProductsDetailsModel {
  bool status;
  dynamic message;
  Data data;

  ProductsDetailsModel(
      {required this.status, this.message, required this.data});

  factory ProductsDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsDetailsModelToJson(this);
}

@JsonSerializable()
class Data {
  int id;
  num price;
  num old_price;
  num discount;
  String image;
  String name;
  String description;
  bool in_favorites;
  bool in_cart;
  List<String> images;

  Data(
      {required this.id,
      required this.price,
      required this.old_price,
      required this.discount,
      required this.image,
      required this.name,
      required this.description,
      required this.in_favorites,
      required this.in_cart,
      required this.images});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
