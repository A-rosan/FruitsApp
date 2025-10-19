import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fruits_app/features/check_out/domain/order_entity.dart';

class Details {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  factory Details.fromMap(Map<String, dynamic> data) => Details(
        subtotal: data['subtotal'] as String?,
        shipping: data['shipping'] as String?,
        shippingDiscount: data['shipping_discount'] as double?,
      );

  factory Details.fromEntity(OrderEntity orderEntity) {
    return Details(
      subtotal: orderEntity.cartEntity.calculateTotalPrice().toString(),
      shipping: orderEntity.calculateShippingCost().toString(),
      shippingDiscount: orderEntity.calculateShippingDiscount(),
    );
  }

  Map<String, dynamic> toMap() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Details].
  factory Details.fromJson(String data) {
    return Details.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Details] to a JSON string.
  String toJson() => json.encode(toMap());
}
