import '../../../../cart/domain/entity/cart_items_entity.dart';

class OrderProductModel {
  final String? productCode;
  final String? productName;
  final String? productImage;
  final String? productPrice;
  final int? quantity;
  OrderProductModel({
    required this.productCode,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.quantity,
  });
  factory OrderProductModel.fromEntity(
      {required CartItemsEntity cartItemsEntity}) {
    return OrderProductModel(
      productCode: cartItemsEntity.productEntity.productCode,
      productName: cartItemsEntity.productEntity.productName,
      productImage: cartItemsEntity.productEntity.imageUrl,
      productPrice: cartItemsEntity.productEntity.productPrice,
      quantity: cartItemsEntity.quantity,
    );
  }
  toJson() {
    return {
      'productCode': productCode,
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'quantity': quantity,
    };
  }
}
