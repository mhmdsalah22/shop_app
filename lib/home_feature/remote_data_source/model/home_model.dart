import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  bool status;
  dynamic message;
  DataBean data;

  HomeModel({required this.status, this.message, required this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class DataBean {
  List<BannersBean> banners;
  List<ProductsBean> products;
  String ad;

  DataBean({required this.banners,required this.products, required this.ad});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class ProductsBean {
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

  ProductsBean({required this.id, required this.price, required this.old_price, required this.discount, required this.image, required this.name, required this.description, required this.images, required this.in_favorites, required this.in_cart});

  factory ProductsBean.fromJson(Map<String, dynamic> json) => _$ProductsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsBeanToJson(this);
}

@JsonSerializable()
class BannersBean {
  int id;
  String image;
  dynamic category;
  dynamic product;

  BannersBean({required this.id, required this.image, this.category, this.product});

  factory BannersBean.fromJson(Map<String, dynamic> json) => _$BannersBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BannersBeanToJson(this);
}

