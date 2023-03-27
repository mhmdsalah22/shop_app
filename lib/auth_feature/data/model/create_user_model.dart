// import 'package:equatable/equatable.dart';
//
// class CreateUserModel extends Equatable{
//   final String name;
//   final String email;
//   final String phone;
//   final String uId;
//
//   const CreateUserModel({
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.uId
//   });
//   factory CreateUserModel.fromJson(Map<String, dynamic> json) {
//     return CreateUserModel(
//         name: json['name'],
//         email: json['email'],
//         phone: json['phone'],
//         uId: json['uId']);
//   }
//
//   Map<String , dynamic> toMap(){
//     return{
//       'name' : name,
//       'email' :email ,
//       'phone' : phone,
//       'uId':uId,
//     };
//   }
//   @override
//   List<Object?> get props => [name, email, phone, uId];
// }