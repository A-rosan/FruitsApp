import 'package:dartz/dartz.dart';

import '../../../../../../../../core/errors/failuers.dart';
import '../entities/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failuer, void>> addProduct(
      {required AddProductInputEntity addProductInputEntity});
}
