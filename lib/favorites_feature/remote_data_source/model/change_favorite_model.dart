class ChangeFavoriteModel {
   bool status;
   String message;

  ChangeFavoriteModel({required this.status, required this.message});

  factory ChangeFavoriteModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavoriteModel(
        status: json['status'], message: json['message']);
  }
}
