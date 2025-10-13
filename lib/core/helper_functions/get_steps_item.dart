import 'package:flutter/widgets.dart';

import '../../features/check_out/presentation/views/widget/address_section/address_section.dart';
import '../../features/check_out/presentation/views/widget/payment_section/payment_section.dart';

import '../../features/check_out/presentation/views/widget/shipping_section/shipping_secion.dart';

List<String> getSteps() {
  return [
    "الشحن",
    "العنوان",
    "الدفع",
  ];
}
