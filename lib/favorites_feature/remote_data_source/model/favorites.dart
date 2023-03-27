import 'package:json_annotation/json_annotation.dart';
part 'favorites.g.dart';

@JsonSerializable()
class Favorites {
  final bool status;
  final String? message;
  final DataModel data;

  Favorites({required this.status, this.message, required this.data});

  factory Favorites.fromJson(Map<String, dynamic> json) => _$FavoritesFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesToJson(this);
}

@JsonSerializable()
class DataModel {
  num current_page;
  List<Data> data;
  String first_page_url;
  num from;
  num last_page;
  String last_page_url;
  dynamic next_page_url;
  String path;
  num per_page;
  dynamic prev_page_url;
  num to;
  num total;

  DataModel({required this.current_page, required this.data, required this.first_page_url, required this.from, required this.last_page, required this.last_page_url, this.next_page_url, required this.path, required this.per_page, this.prev_page_url, required this.to,required this.total});

  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

@JsonSerializable()
class Data {
  int id;
  Product product;

  Data({required this.id, required this.product});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Product {
  int id;
  num price;
  num old_price;
  int discount;
  String image;
  String name;
  String description;

  Product({required this.id, required this.price, required this.old_price, required this.discount, required this.image, required this.name, required this.description});
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

