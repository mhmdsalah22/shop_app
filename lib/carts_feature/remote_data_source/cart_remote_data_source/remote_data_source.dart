import 'package:dio/dio.dart';
import 'package:shop_application/core/end_points.dart';
import 'package:shop_application/core/error/failure.dart';
import 'package:shop_application/core/network/remote/dio_helper.dart';
import 'package:shop_application/core/utiles/contants.dart';

class CartRemoteDataSource {
  Future<Response> addDeleteCart({
    required int productId,
  }) async {
    try {
      DioHelper.dio.options.headers = {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': token,
      };
      final result = await DioHelper.dio.post(carts, data: {
        'product_id': productId,
      });
      return result;
    } catch (error) {
      print(error.toString());
      throw ServerFailure(message: error.toString());
    }
  }

  Future<Response> getCarts() async {
    try {
      DioHelper.dio.options.headers = {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': token,
      };
      final result = await DioHelper.dio.get(carts);
      return result;
    } catch (error) {
      print(error);
      throw ServerFailure(message: error.toString());
    }
  }
}
