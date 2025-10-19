import 'package:dartz/dartz.dart';

import 'package:fruits_app/core/errors/failuers.dart';
import 'package:fruits_app/core/service/database_service.dart';
// import 'package:fruits_app/core/service/firestore_service.dart';
import 'package:fruits_app/features/check_out/domain/data/model/order_model.dart';

import 'package:fruits_app/features/check_out/domain/order_entity.dart';

import '../../../../../core/utils/end_points.dart';
import 'orders_repo.dart';

class OrderRepoImp implements OrdersRepos {
  final DatabaseService fireStoreService;

  OrderRepoImp(this.fireStoreService);

  @override
  Future<Either<Failuer, void>> addOrder(OrderEntity orderEntity) async {
    try {
      await fireStoreService.addData(
          path: EndPoints.addOrder,
          data: OrderModel.fromEntity(orderEntity).toJson());
      return right(null);
    } catch (e) {
      return left(ServerFailuer("حدث خطا في اضافة الطلب $e"));
    }
  }
}
