import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/cubit/states.dart';

import '../domain/entities/add_product_input_entity.dart';
import '../domain/repos/images_repo/images_repo.dart';
import '../domain/repos/products_repo.dart';

class DashBoardCubit extends Cubit<DashBoardStates> {
  DashBoardCubit(this.imagesRepo, this.productsRepo)
      : super(DashBoardInitialState());
  static DashBoardCubit get(context) => BlocProvider.of(context);

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  //add product function

  Future<void> addProducts(AddProductInputEntity addProductInputEntity) async {
    emit(DashBoardLoadingState());

    //upload image
    final res =
        await imagesRepo.uploadImage(addProductInputEntity.productImageFile);
    log("upload image res: $res");
    res.fold(
      (failuer) => emit(AddProductErrorState(failuer.msg)),
      (imageUrl) async {
        addProductInputEntity.imageUrl = imageUrl;
        //add product
        var res = await productsRepo.addProduct(
          addProductInputEntity: addProductInputEntity,
        );
        res.fold(
          (failuer) => emit(AddProductErrorState(failuer.msg)),
          (r) => emit(AddProductSuccessState()),
        );
      },
    );
    log("add product res: $res");
  }
}
