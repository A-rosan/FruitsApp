import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubit/products_states.dart';
// import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/repos/products_repo.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit(this.productsRepo) : super(ProductsInitState());

  static ProductsCubit get(context) => BlocProvider.of(context);

  final ProductsRepo productsRepo;
  int productsLenth = 0;

  //get best selling products
  Future<void> getBestSellings() async {
    log("get best selling products");
    emit(ProductsLoadingState());
    var result = await productsRepo.getBestSellings();

    result.fold(
      (failuer) => emit(ProductsErrorState(errorMsg: failuer.msg)),
      (products) => emit(ProductsSuccessState(products)),
    );
    log("get best selling products res: ${result.toString()}");
  }

  //get products
  Future<void> getProducts() async {
    log("get products");
    emit(ProductsLoadingState());
    var result = await productsRepo.getProducts();
    result.fold(
      (failuer) => emit(ProductsErrorState(errorMsg: failuer.msg)),
      (products) {
        productsLenth = products.length;
        emit(ProductsSuccessState(products));
      },
    );
    log("get products res: $result");
  }
}
