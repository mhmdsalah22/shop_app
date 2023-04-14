import 'package:shop_application/carts_feature/remote_data_source/model/update_carts_model.dart';

abstract class DeleteCartStates{}

class InitialDeleteCartState extends DeleteCartStates{}

class SuccessDeleteCartsState extends DeleteCartStates{
  final UpdateCartsModel updateCartsModel;

  SuccessDeleteCartsState(this.updateCartsModel);

}


class ErrorDeleteCartsState extends DeleteCartStates{
  final String error;

  ErrorDeleteCartsState(this.error);
}
