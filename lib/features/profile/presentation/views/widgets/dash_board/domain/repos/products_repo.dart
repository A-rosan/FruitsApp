import '../entities/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<void> addProduct(
      {required AddProductInputEntity addProductInputEntity});
}
