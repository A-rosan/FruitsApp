import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/cart/cubit/states.dart';
import 'package:fruits_app/features/cart/domain/entity/cart_entity.dart';
// import 'package:fruits_app/features/cart/domain/entity/cart_items_entity.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitState());
  static CartCubit get(context) => BlocProvider.of(context);

  CartEntity cartEntity = CartEntity(cartItems: []);

//add product to cart
  void addProductToCart(AddProductInputEntity productEntitey) {
    bool isProductExist = cartEntity.isProductExistInCart(productEntitey);
    var cartItem = cartEntity.getProductFromCart(productEntitey);
    if (isProductExist) {
      log('product exist');
      //increase product count
      cartItem.incraseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(AddCartItemState());
    emit(UpdateCartState());
  }

  //remove product from cart
  void removeProductFromCart(AddProductInputEntity productEntitey) {
    log('remove product from cart');
    cartEntity.removeProductFromCart(productEntitey);
    emit(RemoveCartItemState());
    emit(UpdateCartState());
  }

//increase product count
  void increaseItemCount(AddProductInputEntity productEntity) {
    log('increase product count');
    var item = cartEntity.getProductFromCart(productEntity);
    item.incraseCount();
    emit(UpdateCartState());
  }

//decrease product count
  void decreaseItemCount(AddProductInputEntity productEntity) {
    log('decrease product count');
    var item = cartEntity.getProductFromCart(productEntity);
    item.decreasCount();
    emit(UpdateCartState());
  }
}
