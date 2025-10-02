import '../../../profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';

class CartEntity {
  final AddProductInputEntity product;
  final int count;

  CartEntity({
    required this.product,
    this.count = 0,
  });
}
