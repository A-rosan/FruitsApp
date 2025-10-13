import 'package:fruits_app/features/cart/domain/entity/cart_entity.dart';

import '../../cart/domain/entity/cart_items_entity.dart';
import 'address_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? cashOnDelivery;
  final AddressEntity? addressEntity;

  OrderEntity({
    this.cashOnDelivery,
    required this.addressEntity,
    required this.cartEntity,
  });
}
