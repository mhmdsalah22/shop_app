import 'package:shop_application/carts_feature/remote_data_source/model/update_carts_model.dart';

abstract class UpdateCartsStates{}

class InitialUpdateCartsStates extends UpdateCartsStates{}

class SuccessPlusUpdateCartsState extends UpdateCartsStates{
  final UpdateCartsModel updateCartsModel;

  SuccessPlusUpdateCartsState(this.updateCartsModel);

}


class ErrorPlusUpdateCartsState extends UpdateCartsStates{
  final String error;

  ErrorPlusUpdateCartsState(this.error);
}

class SuccessMinusUpdateCartsState extends UpdateCartsStates{
  final UpdateCartsModel updateCartsModel;

  SuccessMinusUpdateCartsState(this.updateCartsModel);

}


class ErrorMinusUpdateCartsState extends UpdateCartsStates{
  final String error;

  ErrorMinusUpdateCartsState(this.error);
}
