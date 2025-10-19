import 'dart:convert';

import '../order_entity.dart';
import 'amount.dart';
import 'item_list.dart';

class PayPalEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PayPalEntity({this.amount, this.description, this.itemList});

  factory PayPalEntity.fromMap(Map<String, dynamic> data) => PayPalEntity(
        amount: data['amount'] == null
            ? null
            : Amount.fromMap(data['amount'] as Map<String, dynamic>),
        description: data['description'] as String?,
        itemList: data['item_list'] == null
            ? null
            : ItemList.fromMap(data['item_list'] as Map<String, dynamic>),
      );
  factory PayPalEntity.fromEntity(OrderEntity orderEntity) {
    return PayPalEntity(
      amount: Amount.fromEntity(orderEntity),
      description: 'Order Payment',
      itemList: ItemList.fromEntity(orderEntity.cartEntity.cartItems!),
    );
  }

  Map<String, dynamic> toMap() => {
        'amount': amount?.toMap(),
        'description': description,
        'item_list': itemList?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PayPalEntity].
  // factory PayPalEntity.fromJson(String data) {
  //   return PayPalEntity.fromMap(json.decode(data) as Map<String, dynamic>);
  // }

  /// `dart:convert`
  ///
  /// Converts [PayPalEntity] to a JSON string.
  String toJson() => json.encode(toMap());
}
