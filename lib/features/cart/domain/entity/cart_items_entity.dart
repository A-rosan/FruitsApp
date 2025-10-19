import 'package:equatable/equatable.dart';

import '../../../profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';

class CartItemsEntity extends Equatable {
  final AddProductInputEntity productEntity;
  int? quantity;

  CartItemsEntity({
    required this.productEntity,
    this.quantity,
  });

  num calculateTotalPrice() {
    return num.parse(productEntity.productPrice!) * quantity!;
  }

  num calculateTotalWeight() {
    return num.parse(productEntity.unitMount!) * quantity!;
  }

  incraseQuantity() {
    quantity = quantity! + 1;
  }

  decreasQuantity() {
    if (quantity! > 1) {
      quantity = quantity! - 1;
    }
  }

  @override
  List<Object?> get props => [productEntity];
}
