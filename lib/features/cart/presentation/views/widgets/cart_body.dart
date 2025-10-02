import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/core/widgets/costum_divider.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import 'cart_widget_build.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              "لديك 3 منتجات في سله التسوق",
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
              return CartWidgetBuild();
            },
            itemCount: 3,
            separatorBuilder: (context, index) => CustomDivider(),
          ),
        ),
        // Gap(5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: hrAppPadding),
          child: CustomButton(
            onPressed: () {},
            buttonText: "الدفع  120جنيه",
          ),
        )
      ],
    );
  }
}
