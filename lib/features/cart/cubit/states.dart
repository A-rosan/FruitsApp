// import 'package:fruits_app/features/cart/domain/entity/cart_entity.dart';

abstract class CartStates {}

class CartInitState extends CartStates {}

class CartLoadingState extends CartStates {}

class AddCartItemState extends CartStates {}

class RemoveCartItemState extends CartStates {}

class CartErrorState extends CartStates {
  String errorMsg;
  CartErrorState({required this.errorMsg});
}
