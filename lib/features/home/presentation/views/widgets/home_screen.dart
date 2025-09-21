import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/core/widgets/custom_home_app_bar.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/widgets/custom_search_bar.dart';
import '../../../../best_selling/presentation/views/best_selling_screen.dart';
import 'best_selling_grid.dart';
import 'feature_container.dart';
// import 'items_build.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: hrAppPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                Gap(16),
                SearchTextField(
                  controller: searchController,
                ),
                Gap(12),
                SizedBox(
                  height: 158,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: FeatureContainer(),
                      ),
                    ),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الأكثر مبيعًا",
                      style: AppTextStyle.bold16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, BestSellingScreen.routeName);
                      },
                      child: Text(
                        "المزيد",
                        style: AppTextStyle.regular13
                            .copyWith(color: AppColors.greyText),
                      ),
                    ),
                  ],
                ),
                Gap(8),
              ],
            ),
          ),
          BestSellingGrid(),
        ],
      ),
    );
  }
}
