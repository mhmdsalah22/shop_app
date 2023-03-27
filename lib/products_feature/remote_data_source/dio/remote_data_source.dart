import 'package:dio/dio.dart';
import 'package:shop_application/core/end_points.dart';
import 'package:shop_application/core/error/failure.dart';
import 'package:shop_application/core/network/remote/dio_helper.dart';

class HomeRemoteDataSource{
  Future<Response> getData({
    required String url,
    String lang = 'en',
    String? token ,
})async{
    try{
      DioHelper.dio.options.headers ={
        'Lang':lang,
        'Content-Type':'application/json',
        'Authorization' : token??'',
      };
      final result  = await DioHelper.dio.get(url,);
      return result;
    }catch(e){
      print(e);
      throw ServerFailure(message: e.toString());
    }
  }
}