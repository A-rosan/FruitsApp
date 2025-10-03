import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/cart/domain/entity/cart_items_entity.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../cubit/cubit.dart';
import '../../../cubit/states.dart';

class CartWidgetBuild extends StatelessWidget {
  const CartWidgetBuild({
    super.key,
    required this.cartItemEntity,
  });
  final CartItemsEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        //todo rebuild widget when count change
        var cubit = CartCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: hrAppPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 92,
                width: 73,
                decoration: BoxDecoration(color: AppColors.containerColor),
                child: Image.network(
                  cartItemEntity.productEntity.imageUrl!,
                  fit: BoxFit.contain,
                ),
              ),
              Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartItemEntity.productEntity.productName ??
                              "اسم المنتج",
                          style: AppTextStyle.bold13,
                        ),
                        GestureDetector(
                          onTap: () {
                            cubit.removeProductFromCart(
                                cartItemEntity.productEntity);
                          },
                          child: Icon(
                            Icons.delete_outline,
                            color: AppColors.greyIcon,
                          ),
                        ),
                      ],
                    ),
                    Gap(4),
                    Text(
                      "${cartItemEntity.calculateTotalWeight()} جم",
                      style: AppTextStyle.regular13
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                    Gap(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                cartItemEntity.incraseCount();
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryColor,
                                ),
                                child: Icon(Icons.add,
                                    size: 18, color: Colors.white),
                              ),
                            ),
                            Gap(12),
                            Text(
                              "${cartItemEntity.count}",
                              style: AppTextStyle.bold13,
                            ),
                            Gap(12),
                            GestureDetector(
                              onTap: () {
                                cartItemEntity.decreasCount();
                              },
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.containerColor,
                                ),
                                child: Icon(Icons.remove,
                                    size: 18, color: AppColors.grey),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "${cartItemEntity.calculateTotalPrice()} دولار",
                          style: AppTextStyle.bold16
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                    Gap(10),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
