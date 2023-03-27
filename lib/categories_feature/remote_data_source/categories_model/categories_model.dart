class CategoriesModel {
  bool status;
  CategoriesDataModel data;

  CategoriesModel({
    required this.status,
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json['status'],
      data: CategoriesDataModel.fromJson(json['data']),
    );
  }
}

class CategoriesDataModel {
  int currentPage = 0;
   List<DataModel> data =[];


   CategoriesDataModel.fromJson(Map<String, dynamic> json) {
        currentPage = json['current_page'];
        if (json['data'] != null) {
          data = <DataModel>[];
          json['data'].forEach((v) {
            data.add(DataModel.fromJson(v));
          });
        }

  }
}

class DataModel {
  int id;
  String name;
  String image;

  DataModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(id: json['id'], name: json['name'], image: json['image']);
  }
}
