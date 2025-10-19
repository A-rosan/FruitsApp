import 'dart:convert';

import 'package:fruits_app/features/cart/domain/entity/cart_entity.dart';
import 'package:fruits_app/features/cart/domain/entity/cart_items_entity.dart';

import '../../../../core/helper_functions/get_currency.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        name: data['name'] as String?,
        quantity: data['quantity'] as int?,
        price: data['price'] as String?,
        currency: data['currency'] as String?,
      );

  factory Item.fromEntity(CartItemsEntity cartItemsEntity) {
    // Implement conversion from your entity to Item
    return Item(
      name: cartItemsEntity.productEntity.productName,
      quantity: cartItemsEntity.quantity,
      price: cartItemsEntity.productEntity.productPrice,
      currency: getCurrency(), // or get it from your entity if available
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  // factory Item.fromJson(String data) {
  //   return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  // }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());
}
