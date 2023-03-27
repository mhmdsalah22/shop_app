import 'package:dio/dio.dart';
import 'package:shop_application/core/end_points.dart';
import 'package:shop_application/core/error/failure.dart';
import 'package:shop_application/core/network/remote/dio_helper.dart';
import 'package:shop_application/core/utiles/contants.dart';

class RemoteDataSourceFavorite {
  Future<Response> changeFavorite({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      DioHelper.dio.options.headers = {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': token,
      };
      final result = await DioHelper.dio.post(url, data: data);
      return result;
    } catch (error) {
      print(error);
      throw ServerFailure(message: error.toString());
    }
  }

  Future<Response> getFavorite() async {
    try {
      DioHelper.dio.options.headers = {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': token,
      };
      final result = await DioHelper.dio.get(Favorites);
      return result;
    } catch (error) {
      print(error);
      throw ServerFailure(message: error.toString());
    }
  }
}
