import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/auth_feature/controller/profile_cubit/profile_states.dart';
import 'package:shop_application/auth_feature/data/data_sources/remote_data_source_api.dart';
import 'package:shop_application/auth_feature/data/model/user_model.dart';

class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(InitialState());

  static ProfileCubit get(BuildContext context)=>BlocProvider.of(context);

  void getProfile(){
    emit(LoadingGetProfileState());
    RemoteDataSourceApi().getProfileData().then((value) {
      emit(SuccessGetProfileState(userModel: UserModel.fromJson(value.data)));
    }).catchError((error){
      emit(ErrorGetProfileState(error.toString()));
      print(error);
    });
  }


  void updateData({
    required String name,
    required String email,
    required String phone,
})
  {
    emit(LoadingUpdateDataProfileState());
    RemoteDataSourceApi().updateData(data: {
      'name': name ,
      'email' : email,
      'phone' : phone,
    }).then((value) {
      print(value.data);
      emit(SuccessGetProfileState(userModel: UserModel.fromJson(value.data)));
    }).catchError((error)
    {
      emit(ErrorGetProfileState(error.toString()));
    });
  }
}