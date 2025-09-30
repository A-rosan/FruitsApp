import 'package:flutter/material.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';

import 'items_build.dart';

class BestSellingGrid extends StatelessWidget {
  const BestSellingGrid({
    super.key,
    required this.products,
  });
  final List<AddProductInputEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ItemsBuildWidget(
          products: products[index],
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
    );
  }
}
