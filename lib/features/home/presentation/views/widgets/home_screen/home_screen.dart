import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubit/products_cubit.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/core/widgets/custom_home_app_bar.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/cubit/products_states.dart';
import '../../../../../../core/helper_functions/get_dummy.dart';
import '../../../../../../core/service/get_it_service.dart';
import '../../../../../../core/utils/app_constant.dart';
import '../../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../../core/widgets/custom_search_bar.dart';
import '../../../../../best_selling/presentation/views/best_selling_screen.dart';
import '../../../../../profile/presentation/views/widgets/dash_board/domain/repos/products_repo.dart';
import '../products_grid_build.dart';
import '../feature_container.dart';
// import 'items_build.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(getIt<ProductsRepo>())..getBestSellings(),
      // ..getProducts(),
      child: BlocConsumer<ProductsCubit, ProductsStates>(
          listener: (context, state) {},
          builder: (context, state) {
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
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
                  state is ProductsSuccessState
                      ? ProductsGridBuild(products: state.products)
                      : state is ProductsErrorState
                          ? SliverToBoxAdapter(
                              child: CustomErrorWidget(text: state.errorMsg))
                          : Skeletonizer.sliver(
                              enabled: true,
                              child: ProductsGridBuild(
                                products: getDummy(),
                              ),
                            ),
                ],
              ),
            );
          }),
    );
  }
}
