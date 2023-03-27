import 'package:dio/dio.dart';
import 'package:shop_application/core/error/failure.dart';
import 'package:shop_application/core/network/remote/dio_helper.dart';
import 'package:shop_application/core/utiles/contants.dart';

class CategoryDetailsRemoteDataSource
{
  Future<Response> categoryDetails({
    required int categoryId,
})async
  {
    try {
      DioHelper.dio.options.headers = {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': token,
      };
      final result = await DioHelper.dio.get('categories/$categoryId');
      return result;
    }catch(error)
    {
      print(error);
      throw ServerFailure(message: error.toString());
    }
  }
}