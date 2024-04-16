import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/utils/constants/sizes.dart';
import 'package:viajes/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.title,
      this.showBackArrow = true,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: showBackArrow
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop())
            : leadingOnPressed != null
                ? IconButton(
                    icon: Icon(leadingIcon), onPressed: leadingOnPressed)
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
