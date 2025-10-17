import 'package:flutter/foundation.dart';
import 'package:fruits_app/features/cart/domain/entity/cart_entity.dart';

// import '../../cart/domain/entity/cart_items_entity.dart';
import 'address_entity.dart';

class OrderEntity extends ChangeNotifier {
  final CartEntity cartEntity;
  bool? cashOnDelivery;
  AddressEntity? addressEntity;

  OrderEntity({
    this.cashOnDelivery,
    required this.addressEntity,
    required this.cartEntity,
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
}
