import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utils/app_text_style.dart';
import 'shipping_item.dart';

class ShippingSecion extends StatefulWidget {
  const ShippingSecion({super.key});

  @override
  State<ShippingSecion> createState() => _ShippingSecionState();
}

class _ShippingSecionState extends State<ShippingSecion> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(32),
        ShippingItem(
          title: "الدفع عند الاستلام",
          supTitle: "التسليم من المكان",
          cashOnDelivery: selectedIndex == 0,
          price: "40 \$",
          onTap: () {
            setState(() => selectedIndex = 0);
          },
        ),
        Gap(8),
        ShippingItem(
          title: "اشتري الان وادفع لاحقا",
          supTitle: "يرجي تحديد طريقه الدفع",
          cashOnDelivery: selectedIndex == 1,
          price: "مجاني",
          onTap: () {
            setState(() => selectedIndex = 1);
          },
        ),
      ],
    );
  }
}
