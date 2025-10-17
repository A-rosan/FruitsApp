import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fruits_app/core/utils/app_constant.dart';
// import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:fruits_app/core/utils/app_decorations.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
// import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/costum_divider.dart';
import '../../../../domain/order_entity.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Safely read the current address and build a readable string.
    // Use `watch` so the UI updates when the addressEntity changes.
    final order = context.watch<OrderEntity>();
    final addressEntity = order.addressEntity;
    String addressText;
    if (addressEntity == null) {
      addressText = 'لم يتم إضافة عنوان';
    } else {
      final parts = [
        addressEntity.address,
        addressEntity.city,
        addressEntity.floor
      ];
      addressText =
          parts.where((p) => p != null && p.trim().isNotEmpty).join(', ');
      if (addressText.isEmpty) addressText = 'لم يتم إضافة عنوان';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(16),
        Text(
          "ملخص الطلب :",
          style: AppTextStyle.bold13,
        ),
        Gap(8),
        Container(
          decoration: AppDecorations.greyDecoration,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 4,
                  right: 4,
                  bottom: 9,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "المجموع الفرعي :",
                      style: AppTextStyle.regular13
                          .copyWith(color: AppColors.greyText),
                    ),
                    Text(
                      "\$${context.read<OrderEntity>().cartEntity.calculateTotalPrice()}",
                      style: AppTextStyle.semiBold16,
                    ),
                  ],
                ),
              ),
              // Gap(9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "التوصيل :",
                    style: AppTextStyle.regular13
                        .copyWith(color: AppColors.greyText),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "\$10",
                      style: AppTextStyle.semiBold13
                          .copyWith(color: AppColors.greyText),
                    ),
                  ),
                ],
              ),
              Gap(8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: CustomDivider(),
              ),
              Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الكلي",
                    style: AppTextStyle.bold16,
                  ),
                  Text(
                    "\$${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 10}",
                    style: AppTextStyle.bold16,
                  ),
                ],
              ),
              Gap(15),
            ],
          ),
        ),
        Gap(16),
        Text(
          "عنوان التوصيل",
          style: AppTextStyle.bold13,
        ),
        Gap(8),
        // Container(
        //   decoration: AppDecorations.greyDecoration,
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 9,
        //       vertical: 5,
        //     ),
        //     child: Column(
        //       // mainAxisSize: MainAxisSize.max,
        //       children: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               "وسيلة الدفع",
        //               style: AppTextStyle.bold13,
        //             ),
        //             Row(
        //               children: [
        //                 Icon(
        //                   Icons.edit,
        //                   size: 12,
        //                 ),
        //                 Gap(5),
        //                 Text(
        //                   "تعديل",
        //                   style: AppTextStyle.semiBold13
        //                       .copyWith(color: AppColors.greyText),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //         Gap(13),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           crossAxisAlignment: CrossAxisAlignment.end,
        //           children: [
        //             Text(
        //               "6522 **** **** ****",
        //               style: AppTextStyle.reg16
        //                   .copyWith(color: AppColors.greyText),
        //             ),
        //             SvgPicture.asset(
        //               "assets/images/visa_icon.svg",
        //               width: 53,
        //               height: 37,
        //               // fit: BoxFit.fill,
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // Gap(8),
        Container(
          decoration: AppDecorations.greyDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 16,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 23,
                          color: AppColors.greyText,
                        ),
                        Gap(5),
                        Text(
                          addressText,
                          style: AppTextStyle.reg16
                              .copyWith(color: AppColors.greyText),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.edit,
                    //       size: 12,
                    //       color: AppColors.greyText,
                    //     ),
                    //     Gap(5),
                    //     Text(
                    //       "تعديل",
                    //       style: AppTextStyle.semiBold13
                    //           .copyWith(color: AppColors.greyText),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
