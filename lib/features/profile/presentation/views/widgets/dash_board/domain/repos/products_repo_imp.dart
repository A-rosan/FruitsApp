import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/service/database_service.dart';
// import 'package:fruits_app/core/service/firestore_service.dart';
import 'package:fruits_app/core/utils/end_points.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/model/add_product_model.dart';

import '../../../../../../../../core/errors/failuers.dart';
import '../entities/add_product_input_entity.dart';
import 'products_repo.dart';

class ProductsRepoImp implements ProductsRepo {
  DatabaseService databaseService;

  ProductsRepoImp({required this.databaseService});
  @override
  //add product imp funcion
  Future<Either<Failuer, void>> addProduct({
    required AddProductInputEntity addProductInputEntity,
  }) async {
    try {
      await databaseService.addData(
        path: EndPoints.addProduct,
        data: AddProductModel.fromEntity(addProductInputEntity).toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailuer("حدث خطا في اضافة المنتج"));
    }
  }
}
