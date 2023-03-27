import 'package:dio/dio.dart';
import 'package:shop_application/core/end_points.dart';
import 'package:shop_application/core/error/failure.dart';
import 'package:shop_application/core/network/remote/dio_helper.dart';
import 'package:shop_application/core/utiles/contants.dart';

class RemoteDataSourceApi {
  Future<Response> userData(
      {required String url, required Map<String, dynamic> data}) async {
    try {
      DioHelper.dio.options.headers = {
        'lang': 'ar',
        'Content-Type': 'application/json',
      };
      final result = await DioHelper.dio.post(url, data: data);
      return result;
    } catch (e) {
      print(e);
      throw ServerFailure(message: e.toString());
    }
  }

  Future<Response> getProfileData() async {
    try {
      DioHelper.dio.options.headers = {
        'lang': 'ar',
        'Content-Type': 'application/json',
        'Authorization': token
      };
      final result = await DioHelper.dio.get(profile);
      return result;
    } catch (error) {
      print(error);
      throw ServerFailure(message: error.toString());
    }
  }


  Future<Response> updateData({
    required Map<String , dynamic>data,
})async {
    try {
      DioHelper.dio.options.headers = {
        'lang': 'ar',
        'Content-Type': 'application/json',
        'Authorization': token
      };
      final result = await DioHelper.dio.put(updateProfile, data: data);
      return result;
    }catch(error){
      print(error);
      throw ServerFailure(message: error.toString());
    }
  }
}
