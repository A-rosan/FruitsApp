import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/core/widgets/costum_divider.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/cart/cubit/cubit.dart';
import 'package:fruits_app/features/cart/domain/entity/cart_items_entity.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../cubit/states.dart';
import 'cart_widget_build.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
    required this.cartItems,
  });
  final List<CartItemsEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Column(
          children: [
            Container(
              width: double.infinity,
              height: 42,
              decoration: ShapeDecoration(
                color: AppColors.logOutColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Center(
                child: Text(
                  "${cartItems.length} لديك منتجات في السلة",
                  style: AppTextStyle.regular13
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ),
            Gap(20),
            CustomDivider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.63,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return CartWidgetBuild(
                    cartItemEntity: cartItems[index],
                  );
                },
                itemCount: cartItems.length,
                separatorBuilder: (context, index) => CustomDivider(),
              ),
            ),
            // Gap(5),
            cartItems.isEmpty
                ? SizedBox.shrink()
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: hrAppPadding),
                    child: CustomButton(
                      onPressed: () {},
                      buttonText:
                          "${cubit.cartEntity.calculateTotalPrice()} دولار",
                    ),
                  )
          ],
        );
      },
    );
  }
}
