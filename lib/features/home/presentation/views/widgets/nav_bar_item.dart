import 'package:flutter/material.dart';

import '../../../domain/entities.dart';
import 'active_item.dart';
import 'un_active_item.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    this.isActive = false,
    required this.item,
  });
  final bool isActive;
  final BtmNavBarEntity item;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(
            assetName: item.activeImage,
            title: item.name,
          )
        : UnActiveItem(assetName: item.unActiveImage);
  }
}
