import 'dart:io';

import 'package:fruits_app/features/cart/domain/entity/cart_entity.dart';
import 'package:fruits_app/features/cart/domain/entity/cart_items_entity.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';
import 'package:fruits_app/features/check_out/domain/data/model/shipping_address_model.dart';
import 'package:fruits_app/features/check_out/domain/order_entity.dart';

import 'order_product_model.dart';
import '../../address_entity.dart';

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
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      userId: json['userId'],
      totalPrice: json['totalPrice'],
      addressModel: AddressModel.fromJson(json['address']),
      orderProductsModleList: (json['orderProducts'] as List)
          .map((orderProductJson) =>
              OrderProductModel.fromJson(orderProductJson))
          .toList(),
      paymentMethod: json['paymentMethod'],
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

  OrderEntity toEntity() {
    // Convert order products into CartItemsEntity list using a minimal
    // AddProductInputEntity. Some fields are not available in the order
    // payload (like productImageFile), so provide safe defaults where
    // required by the AddProductInputEntity constructor.
    final cartItems = orderProductsModleList.map((orderProduct) {
      final productEntity = AddProductInputEntity(
        productName: orderProduct.productName,
        productPrice: orderProduct.productPrice,
        productCode: orderProduct.productCode,
        productDescription: null,
        productImageFile: File(''),
        productisFeatured: false,
        imageUrl: orderProduct.productImage,
        expMonth: null,
        isOrganic: null,
        calories: null,
        unitMount: '1',
        reviews: [],
      );

      return CartItemsEntity(
          productEntity: productEntity, quantity: orderProduct.quantity);
    }).toList();

    final cartEntity = CartEntity(cartItems: cartItems);

    final address = AddressEntity(
      name: addressModel.name,
      email: addressModel.email,
      address: addressModel.address,
      city: addressModel.city,
      floor: addressModel.floor,
      phone: addressModel.phone,
    );

    final cashOnDelivery = paymentMethod == 'Cash on Delivery';

    return OrderEntity(
      cartEntity: cartEntity,
      userId: userId,
      addressEntity: address,
      cashOnDelivery: cashOnDelivery,
    );
  }
}
