import 'dart:convert';

import 'package:fruits_app/features/cart/domain/entity/cart_items_entity.dart';

import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  factory ItemList.fromMap(Map<String, dynamic> data) => ItemList(
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
      );
  factory ItemList.fromEntity(List<CartItemsEntity> itemsEntity) {
    return ItemList(
      items: itemsEntity.map((cartItem) => Item.fromEntity(cartItem)).toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'items': items?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ItemList].
  // factory ItemList.fromJson(String data) {
  //   return ItemList.fromMap(json.decode(data) as Map<String, dynamic>);
  // }

  /// `dart:convert`
  ///
  /// Converts [ItemList] to a JSON string.
  String toJson() => json.encode(toMap());
}
