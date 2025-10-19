import 'package:fruits_app/features/check_out/domain/data/model/shipping_address_model.dart';
import 'package:fruits_app/features/check_out/domain/order_entity.dart';

import 'order_product_model.dart';

class OrderModel {
  //data that represent order for firestore
  final String userId;
  final num totalPrice;
  final AddressModel addressModel;
  final List<OrderProductModel> orderProductsModleList;
  final String paymentMethod;
  OrderModel({
    required this.userId,
    required this.totalPrice,
    required this.addressModel,
    required this.orderProductsModleList,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      userId: orderEntity.userId,
      totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
      addressModel: AddressModel.fromEntity(orderEntity.addressEntity!),
      orderProductsModleList: orderEntity.cartEntity.cartItems!
          .map((cartItem) =>
              OrderProductModel.fromEntity(cartItemsEntity: cartItem))
          .toList(),
      paymentMethod:
          orderEntity.cashOnDelivery == true ? 'Cash on Delivery' : 'Online',
    );
  }

  toJson() {
    return {
      "userId": userId,
      "totalPrice": totalPrice,
      "address": addressModel.toJson(),
      "status": "pending",
      "dateTime": DateTime.now().toString(),
      "orderProducts": orderProductsModleList
          .map((orderProduct) => orderProduct.toJson())
          .toList(),
      "paymentMethod": paymentMethod,
    };
  }
}
