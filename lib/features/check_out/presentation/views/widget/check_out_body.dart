import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/check_out/domain/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruits_app/features/check_out/presentation/views/widget/check_out_page_view.dart';
import 'package:fruits_app/features/check_out/presentation/views/widget/check_out_step_list.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// import '../../../../../core/helper_functions/get_steps_item.dart';
// import '../../../../../core/utils/app_text_style.dart';
// import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../domain/address_entity.dart';
import '../../../domain/order_entity.dart';
import '../../cubit/cubit.dart';
// import 'active_step_item.dart';
// import 'un_active_step_item.dart';

class CheckOutBody extends StatefulWidget {
  const CheckOutBody({
    super.key,
  });

  @override
  State<CheckOutBody> createState() => _CheckOutBodyState();
}

class _CheckOutBodyState extends State<CheckOutBody> {
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  late PageController pageController;
  int currentPageIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool canScroll = false;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.read<OrderEntity>();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: hrAppPadding,
        vertical: vrAppPadding,
      ),
      child: Column(
        children: [
          CheckOutStepList(
            currentIndex: currentPageIndex,
          ),
          Expanded(
            child: CheckOutPageView(
              pageController: pageController,
              formKey: formKey,
              valueListenable: valueNotifier,
              isScrollable: canScroll,
            ),
          ),
          CustomButton(
            buttonText: getButttonText(currentPageIndex),
            onPressed: () {
              if (currentPageIndex == 0) {
                cashValidation(provider, context);
              } else if (currentPageIndex == 1) {
                addressValidation();
              } else {
                prossesPayment(context);
              }
            },
          ),
          Gap(30),
        ],
      ),
    );
  }

  void addressValidation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        canScroll = true;
      });
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void cashValidation(OrderEntity provider, BuildContext context) {
    if (provider.cashOnDelivery != null) {
      // setState(() {
      //   canScroll = true;
      // });
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      showCustomErrorSnackBar(context, "اختر طريقة الدفع");
    }
  }

  String getButttonText(int index) {
    switch (index) {
      case 0:
        return "التالي";
      case 1:
        return "التالي";
      case 2:
        return "تاكيد الطلب";
      default:
        return "التالي";
    }
  }

  void prossesPayment(BuildContext context) {
    var provider = context.read<OrderEntity>();
    PayPalEntity payPalEntity = PayPalEntity.fromEntity(provider);
    var addOrderCubit = context.read<AddOrderCubit>();
    log(payPalEntity.toJson().toString());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: "", //TODO put your client id here
        secretKey: "", //TODO put your secret key here
        transactions: [payPalEntity.toJson()],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          Navigator.pop(context);
          addOrderCubit.addOrder(provider);
          log("onSuccess: $params");
          customSuccessBar(context, "تم الدفع بنجاح");
        },
        onError: (error) {
          Navigator.pop(context);
          log("onError: $error");
          showCustomErrorSnackBar(context, "حدث خطا اثناء الدفع");
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }
}
