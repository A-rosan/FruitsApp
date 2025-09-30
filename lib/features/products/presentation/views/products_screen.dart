import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/products_body.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(
        context,
        title: 'المنتجات',
        isHome: true,
        isLeading: true,
      ),
      body: ProductsBody(),
    );
  }
}
