import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failuers.dart';
import '../../order_entity.dart';

abstract class OrdersRepos {
  Future<Either<Failuer, void>> addOrder(OrderEntity orderEntity);
}
