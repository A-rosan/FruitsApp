import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widget/best_selling_body.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});
  static const String routeName = 'bestSelling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(context, title: 'الأكثر مبيعًا', isHome: true),
      body: BestSellingBody(),
    );
  }
}
