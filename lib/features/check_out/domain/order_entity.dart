import 'package:flutter/foundation.dart';
import 'package:fruits_app/features/cart/domain/entity/cart_entity.dart';

// import '../../cart/domain/entity/cart_items_entity.dart';
import 'address_entity.dart';

class OrderEntity extends ChangeNotifier {
  //data that represent order for Ui and logic
  final CartEntity cartEntity;
  bool? cashOnDelivery;
  AddressEntity? addressEntity;
  final String userId;

  OrderEntity({
    this.cashOnDelivery,
    required this.addressEntity,
    required this.cartEntity,
    required this.userId,
  });

  /// Update address parts and notify listeners so UI can react.
  void updateAddress({
    String? name,
    String? email,
    String? address,
    String? city,
    String? floor,
    String? phone,
  }) {
    addressEntity ??= AddressEntity();
    if (name != null) addressEntity!.name = name;
    if (email != null) addressEntity!.email = email;
    if (address != null) addressEntity!.address = address;
    if (city != null) addressEntity!.city = city;
    if (floor != null) addressEntity!.floor = floor;
    if (phone != null) addressEntity!.phone = phone;
    notifyListeners();
  }

  double calculateShippingCost() {
    if (cashOnDelivery!) {
      return 10;
    } else {
      return 0;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }

  // String getCurrency() {
  //   return "jod";
  // }
}
