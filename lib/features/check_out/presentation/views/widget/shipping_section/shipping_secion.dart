import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fruits_app/core/utils/app_colors.dart';
// import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:gap/gap.dart';

// import '../../../../../../core/utils/app_text_style.dart';
import '../../../../domain/order_entity.dart';
import 'shipping_item.dart';

class ShippingSecion extends StatefulWidget {
  const ShippingSecion({super.key});

  @override
  State<ShippingSecion> createState() => _ShippingSecionState();
}

class _ShippingSecionState extends State<ShippingSecion>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var provider = context.read<OrderEntity>();
    return Column(
      children: [
        Gap(32),
        ShippingItem(
          title: "الدفع عند الاستلام",
          supTitle: "التسليم من المكان",
          cashOnDelivery: selectedIndex == 0,
          price: "${(provider.cartEntity.calculateTotalPrice()) + 10} \$",
          onTap: () {
            setState(() {
              selectedIndex = 0;
              provider.cashOnDelivery = true;
            });
          },
        ),
        Gap(8),
        ShippingItem(
          title: "اشتري اونلاين",
          supTitle: "يرجي تحديد طريقه الدفع",
          cashOnDelivery: selectedIndex == 1,
          price: "${provider.cartEntity.calculateTotalPrice()} \$",
          onTap: () {
            setState(() {
              selectedIndex = 1;
              provider.cashOnDelivery = false;
            });
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
