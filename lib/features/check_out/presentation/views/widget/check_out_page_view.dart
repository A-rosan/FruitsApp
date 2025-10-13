import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:provider/provider.dart';

import '../../../../../core/helper_functions/get_steps_item.dart';
import '../../../domain/order_entity.dart';
import 'address_section/address_section.dart';
import 'payment_section/payment_section.dart';
import 'shipping_section/shipping_secion.dart';

class CheckOutPageView extends StatelessWidget {
  CheckOutPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
    required this.isScrollable,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    var provider = context.read<OrderEntity>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: vrAppPadding),
      child: PageView.builder(
        controller: pageController,
        physics: provider.cashOnDelivery != null && isScrollable
            ? const BouncingScrollPhysics()
            : NeverScrollableScrollPhysics(),
        itemCount: getSteps().length,
        itemBuilder: (context, index) {
          return getStepsPages()[index];
        },
      ),
    );
  }

  List<Widget> getStepsPages() {
    return [
      ShippingSecion(),
      AddressSection(
        addressSecFormKey: formKey,
        valueListenable: valueListenable,
      ),
      PaymentSection(),
    ];
  }
}
