import 'package:json_annotation/json_annotation.dart';

part 'category_detail_model.g.dart';

@JsonSerializable()
class CategoryDetailModel {
  bool status;
  dynamic message;
  Data data;

  CategoryDetailModel({required this.status, required this.message,required this.data});

  factory CategoryDetailModel.fromJson(Map<String, dynamic> json) => _$CategoryDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDetailModelToJson(this);
}

@JsonSerializable()
class Data {
  num current_page;
  List<DataModel> data;
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

  Data({required this.current_page, required this.data, required this.first_page_url, required this.from, required this.last_page, required this.last_page_url, required this.next_page_url, required this.path, required this.per_page,required this.prev_page_url, required this.to, required this.total});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class DataModel {
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

  DataModel({required this.id, required this.price, required this.old_price, required this.discount, required this.image, required this.name, required this.description, required this.images, required this.in_favorites, required this.in_cart});

  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

