import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dash_board/domain/entities/add_product_input_entity.dart';
import 'package:gap/gap.dart';

class ItemsBuildWidget extends StatelessWidget {
  const ItemsBuildWidget({
    super.key,
    required this.products,
  });
  final AddProductInputEntity products;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 163,
      // height: 214,
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            // bottom: 0,
            // top: 0,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20),
                products.imageUrl != null
                    ? Flexible(
                        child: Image.network(
                          products.imageUrl!,
                          // height: 114,
                          // width: 105,
                          // fit: BoxFit.scaleDown,
                        ),
                      )
                    : SizedBox(
                        height: 100,
                        width: double.infinity,
                      ),
                Gap(24),
                ListTile(
                  title: Text(
                    "${products.productName}",
                    style: AppTextStyle.semiBold13,
                    textAlign: TextAlign.right,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${products.productPrice}/ ",
                          style: AppTextStyle.bold13
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                        TextSpan(
                          text: "الكيلو",
                          style: AppTextStyle.bold13
                              .copyWith(color: AppColors.lightSecondaryColor),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(
                    Icons.add_circle_outlined,
                    size: 40,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_rounded,
              ),
              color: AppColors.favColor,
            ),
          ),
        ],
      ),
    );
  }
}
