class HomeModel {
  bool status;
  HomeDataModel data;

  HomeModel({required this.status, required this.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        status: json['status'], data: HomeDataModel.fromJson(json['data']));
  }
}

class HomeDataModel {
  List<BannerModel> banners = [];
  List<ProductModel> products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(BannerModel.fromJson(element));
    });

    json['products'].forEach((element) {
      products.add(ProductModel.fromJson(element));
    });
  }
}

class BannerModel {
  int id;
  String image;

  BannerModel({required this.id, required this.image});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(id: json['id'], image: json['image']);
  }
}

class ProductModel {
  int id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String image;
  String name;
  bool inFavorites;
  bool inCart;

  ProductModel(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.inFavorites,
      required this.inCart});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        inFavorites: json['in_favorites'],
        inCart: json['in_cart']);
  }
}
