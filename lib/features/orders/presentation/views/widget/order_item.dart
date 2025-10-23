import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
// import 'package:fruits_app/core/utils/app_decorations.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/features/check_out/domain/order_entity.dart';
import 'package:gap/gap.dart';

import '../../../../check_out/presentation/views/widget/add_order_cubit_bloc_builder/add_order_cubit_bloc_builder.dart';

// unused import removed

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orders});
  final List<OrderEntity>? orders;
  @override
  Widget build(BuildContext context) {
    final items = orders ?? [];

    // Build a column of order Cards. The parent (screen) should provide
    // scrolling (e.g. SingleChildScrollView) so the whole screen scrolls.
    return AddOrderCubitBlocBuilder(
      child: Column(
        children: List.generate(items.length, (orderIndex) {
          final order = items[orderIndex];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Gap(10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Text(
                            "المبلغ :",
                            style: AppTextStyle.bold19,
                          ),
                          Text(
                            "${order.cartEntity.calculateTotalPrice()} \$",
                            style: AppTextStyle.bold19
                                .copyWith(color: AppColors.lightPrimary),
                          ),
                        ],
                      ),
                    ),
                    Gap(10),
                    // Text(
                    //   "رقم المستخدم: ${order.userId}",
                    //   style:
                    //       AppTextStyle.bold13.copyWith(color: AppColors.greyText),
                    //   textAlign: TextAlign.right,
                    // ),
                    // Gap(10),
                    Text(
                      "العنوان:",
                      style: AppTextStyle.bold19,
                      // textAlign: TextAlign.right,
                    ),
                    Text(
                      "${order.addressEntity?.address}, ${order.addressEntity?.city}, ${order.addressEntity?.floor}",
                      style: AppTextStyle.bold16
                          .copyWith(color: AppColors.greyText),
                      textAlign: TextAlign.right,
                    ),
                    Gap(10),
                    Text(
                      "طريقة الدفع: ${order.cashOnDelivery == true ? "الدفع عند الاستلام" : "الدفع أونلاين"}",
                      style: AppTextStyle.bold16
                          .copyWith(color: AppColors.greyText),
                      textAlign: TextAlign.right,
                    ),
                    Gap(10),
                    Text(
                      "المنتجات:",
                      style: AppTextStyle.bold16,
                      textAlign: TextAlign.right,
                    ),
                    // Gap(10),
                    // Products list inside the card (non-scrolling list)
                    Column(
                      children: List.generate(
                        order.cartEntity.cartItems?.length ?? 0,
                        (productIndex) {
                          final product =
                              order.cartEntity.cartItems?[productIndex];
                          if (product == null) return SizedBox.shrink();
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: product.productEntity.imageUrl != null
                                ? Image.network(
                                    product.productEntity.imageUrl!,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                                : SizedBox(width: 50, height: 50),
                            title: Text(
                              product.productEntity.productName ??
                                  "اسم المنتج غير متوفر",
                              style: AppTextStyle.bold16
                                  .copyWith(color: AppColors.greyText),
                              textAlign: TextAlign.right,
                            ),
                            subtitle: Text(
                              "السعر: ${product.calculateTotalPrice()}  العدد: ${product.quantity}",
                              style: AppTextStyle.regular13
                                  .copyWith(color: AppColors.greyText),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
