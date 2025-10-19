import 'dart:convert';

import 'package:fruits_app/features/check_out/domain/order_entity.dart';

import '../../../../core/helper_functions/get_currency.dart';
import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromMap(Map<String, dynamic> data) => Amount(
        total: data['total'] as String?,
        currency: data['currency'] as String?,
        details: data['details'] == null
            ? null
            : Details.fromMap(data['details'] as Map<String, dynamic>),
      );
  factory Amount.fromEntity(OrderEntity orderEntity) {
    return Amount(
      total:
          orderEntity.calculateTotalPriceAfterDiscountAndShipping().toString(),
      currency: getCurrency(),
      details: Details.fromEntity(orderEntity),
    );
  }

  Map<String, dynamic> toMap() => {
        'total': total,
        'currency': currency,
        'details': details?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Amount].
  // factory Amount.fromJson(String data) {
  //   return Amount.fromMap(json.decode(data) as Map<String, dynamic>);
  // }

  /// `dart:convert`
  ///
  /// Converts [Amount] to a JSON string.
  String toJson() => json.encode(toMap());
}
