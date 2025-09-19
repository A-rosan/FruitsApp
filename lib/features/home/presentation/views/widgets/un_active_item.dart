import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UnActiveItem extends StatelessWidget {
  const UnActiveItem({
    super.key,
    required this.assetName,
  });
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: 20,
      height: 20,
    );
  }
}
