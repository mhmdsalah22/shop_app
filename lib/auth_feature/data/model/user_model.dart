import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  bool status;
  String? message;
  Data data;


  UserModel({required this.status, this.message, required this.data});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class Data {
  int id;
  String name;
  String email;
  String phone;
  String image;
  dynamic points;
  dynamic credit;
  String token;

  Data({required this.id, required this.name, required this.email, required this.phone, required this.image, required this.points, required this.credit, required this.token});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

