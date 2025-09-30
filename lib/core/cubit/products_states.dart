import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';

abstract class ProductsStates {}

class ProductsInitState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsSuccessState extends ProductsStates {
  final List<AddProductInputEntity> products;
  ProductsSuccessState(this.products);
}

class ProductsErrorState extends ProductsStates {
  final String errorMsg;
  ProductsErrorState({required this.errorMsg});
}
