import 'package:flutter/material.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/domain/entity/category.dart';
import 'package:viajes/utils/device/device_utility.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({
    super.key,
    required this.categories,
    this.tabController,
  });

  final List<Category> categories;
  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.zero,
      isScrollable: true,
      indicatorColor: TColors.primary,
      unselectedLabelColor: TColors.darkGrey,
      labelColor:
          THelperFunctions.isDarkMode(context) ? TColors.white : TColors.black,
      controller: tabController,
      tabs: categories.map((category) => Tab(text: category.name)).toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
