import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/auth_feature/controller/verify_email_cubit/verify_email_state.dart';
import 'package:shop_application/auth_feature/data/data_sources/remote_data_source.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(InitialVerifyEmailState());

  static VerifyEmailCubit get(BuildContext context) => BlocProvider.of(context);

  Future verifyEmail() async {
    try {
      emit(LoadingVerifyEmailState());
      await RemoteDataSource().sendEmailVerification().then((value) {
        if (RemoteDataSource().isEmailVerified) {
          emit(SuccessVerifyEmailState());
        }
      });
    } on FirebaseAuthException catch (e) {
      emit(ErrorVerifyEmailState(error: e.message.toString()));
    }
  }
}
