import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/cubit/products_cubit.dart';
import '../../../../../core/cubit/products_states.dart';
import '../../../../../core/helper_functions/get_dummy.dart';
import '../../../../../core/service/get_it_service.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_search_bar.dart';
import '../../../../home/presentation/views/widgets/products_grid_build.dart';
import '../../../../profile/presentation/views/widgets/dash_board/domain/repos/products_repo.dart';

class ProductsBody extends StatelessWidget {
  ProductsBody({super.key});
  TextEditingController searchController = TextEditingController();
  int productsCount = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt<ProductsRepo>())..getProducts(),
      child: BlocConsumer<ProductsCubit, ProductsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProductsCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SearchTextField(
                        controller: searchController,
                      ),
                      Gap(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${cubit.productsLenth} نتائج",
                            style: AppTextStyle.bold16,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 44,
                              height: 33,
                              decoration: BoxDecoration(
                                color: AppColors.containerColor,
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(color: AppColors.dividerColor),
                              ),
                              child: Icon(
                                Icons.sort_sharp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(16),
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
        },
      ),
    );
  }
}
