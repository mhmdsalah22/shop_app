import 'package:json_annotation/json_annotation.dart';

part 'update_carts_model.g.dart';

@JsonSerializable()
class UpdateCartsModel {
  bool status;
  String message;
  DataBean data;

  UpdateCartsModel({required this.status, required this.message, required this.data});

  factory UpdateCartsModel.fromJson(Map<String, dynamic> json) => _$UpdateCartsModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartsModelToJson(this);
}

@JsonSerializable()
class DataBean {
  CartModel cart;
  num sub_total;
  num total;

  DataBean({required this.cart, required this.sub_total, required this.total});

  factory DataBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class CartModel {
  int id;
  int quantity;
  Product product;

  CartModel({required this.id, required this.quantity, required this.product});

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@JsonSerializable()
class Product {
  int id;
  num price;
  num old_price;
  num discount;
  String image;

  Product({required this.id, required this.price, required this.old_price, required this.discount, required this.image});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

