import '../../../profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';

class CartItemsEntity {
  final AddProductInputEntity productEntity;
  int? count;

  CartItemsEntity({
    required this.productEntity,
    this.count,
  });

  num calculateTotalPrice() {
    return num.parse(productEntity.productPrice!) * count!;
  }

  num calculateTotalWeight() {
    return num.parse(productEntity.unitMount!) * count!;
  }

  incraseCount() {
    count = count! + 1;
  }

  decreasCount() {
    count = count! - 1;
  }
}
