import 'package:dartz/dartz.dart';

import '../../../../../../../../core/errors/failuers.dart';
import '../entities/add_product_input_entity.dart';

abstract class ProductsRepo {
  //add product
  Future<Either<Failuer, void>> addProduct(
      {required AddProductInputEntity addProductInputEntity});

  //get products
  Future<Either<Failuer, List<AddProductInputEntity>>> getProducts();

  //get bestSellign products
  Future<Either<Failuer, List<AddProductInputEntity>>> getBestSellings();
}
