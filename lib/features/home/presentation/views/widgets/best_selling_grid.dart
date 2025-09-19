import 'package:flutter/material.dart';

import 'items_build.dart';

class BestSellingGrid extends StatelessWidget {
  const BestSellingGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemBuilder: (context, index) {
        return const ItemsBuildWidget();
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
