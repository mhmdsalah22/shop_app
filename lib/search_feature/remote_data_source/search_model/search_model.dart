import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  bool status;
  dynamic message;
  DataModel data;

  SearchModel({required this.status, this.message, required this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json) => _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}

@JsonSerializable()
class DataModel {
  int current_page;
  List<SearchData> data;
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

  DataModel({required this.current_page, required this.data, required this.first_page_url, required this.from, required this.last_page, required this.last_page_url, this.next_page_url, required this.path, required this.per_page, this.prev_page_url, required this.to, required this.total});

  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

@JsonSerializable()
class SearchData {
  int id;
  dynamic price;
  String image;
  String name;
  String description;
  List<String> images;
  bool in_favorites;
  bool in_cart;

  SearchData({required this.id, required this.price, required this.image, required this.name, required this.description, required this.images, required this.in_favorites, required this.in_cart});

  factory SearchData.fromJson(Map<String, dynamic> json) => _$SearchDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDataToJson(this);
}

