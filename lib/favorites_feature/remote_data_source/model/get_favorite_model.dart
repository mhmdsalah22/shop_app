// class FavoritesModel
// {
//   bool status;
//   Null message;
//   Data? data;
//
//   FavoritesModel({required this.status,  this.message,  this.data});
//
//  factory  FavoritesModel.fromJson(Map<String, dynamic> json)
//   {
//     return FavoritesModel(
//         status: json['status'],
//         message: json['message'],
//         data: json['data'] != null ? Data.fromJson(json['data']) : null,
//     );
//
//   }
// }
//
// class Data {
//   int? currentPage;
//   List<FavoritesData>? data;
//
//   Data({
//     required this.currentPage,
//     required this.data
//   });
//
//    Data.fromJson(Map<String, dynamic> json) {
//      currentPage = json['current_page'];
//      if (json['data'] != null) {
//        data = <FavoritesData>[];
//        json['data'].forEach((v) {
//          data?.add(FavoritesData.fromJson(v));
//        });
//      }
//     // return Data(currentPage: json['current_page'],
//     //     data:  json['data'] != null ?
//     //      <FavoritesData>[]:
//     //     json['data'].forEach((v) {
//     //      data.add(FavoritesData.fromJson(v));
//     //     })
//
//     //);
//   }
// }
//
// class FavoritesData {
//   int id;
//   Product? product;
//
//   FavoritesData({required this.id,  this.product});
//
//   factory FavoritesData.fromJson(Map<String, dynamic> json) {
//     return FavoritesData(id: json['id'],
//         product:  json['product'] != null ? Product.fromJson(json['product']) : null
//     );
//
//   }
// }
//
// class Product {
//   int id;
//   dynamic price;
//   dynamic oldPrice;
//   int discount;
//   String image;
//   String name;
//   String description;
//
//   Product({
//     required this.id,
//     required this.price,
//     required this.oldPrice,
//     required this.discount,
//     required this.image,
//     required this.name,
//     required this.description
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//         id: json['id'],
//         price: json['price'],
//         oldPrice: json['old_price'],
//         discount: json['discount'],
//         image: json['image'],
//         name: json['name'],
//         description: json['description']
//     );
//
//   }
//
// }