import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';

import 'cart_items_entity.dart';

class CartEntity {
  final List<CartItemsEntity>? cartItems;
  CartEntity({this.cartItems});
  addCartItem(CartItemsEntity cartItemsEntity) {
    cartItems?.add(cartItemsEntity);
  }

  //is prodcts exist in cart
  bool isProductExistInCart(AddProductInputEntity products) {
    for (var cartItem in cartItems!) {
      if (cartItem.productEntity == products) {
        return true;
      }
    }
    return false;
  }

  //get product from cart
  CartItemsEntity getProductFromCart(AddProductInputEntity products) {
    for (var cartItem in cartItems!) {
      if (cartItem.productEntity == products) {
        return cartItem;
      }
    }
    return CartItemsEntity(productEntity: products, count: 1);
  }

  //remove product from cart
  removeProductFromCart(AddProductInputEntity products) {
    cartItems?.removeWhere((cartItem) => cartItem.productEntity == products);
  }

  //calculate total w price

  // num calculateTotalPrice() {
  //   num totalPrice = 0;
  //   for (var cartItem in cartItems!) {
  //     totalPrice += cartItem.calculateTotalPrice();
  //   }
  //   return totalPrice;
  // }
}
