import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/utils/constants/sizes.dart';
import 'package:viajes/utils/device/device_utility.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';

class TSearchContainer extends ConsumerStatefulWidget {
  const TSearchContainer(
      {super.key,
      this.text = '',
      this.icon = Icons.search_sharp,
      this.showBackground = true,
      this.showBorder = true,
      this.onSearch,
      this.padding =
          const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace)});

  final String? text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final Function(String)? onSearch;
  final EdgeInsetsGeometry padding;

  @override
  TSearchContainerState createState() => TSearchContainerState();
}

class TSearchContainerState extends ConsumerState<TSearchContainer> {
  final TextEditingController controller = TextEditingController();

  Timer? debounceTimer;

  void onChanges(String query) {
    setState(() {});
    if (debounceTimer?.isActive ?? false) {
      debounceTimer!.cancel();
    }
    debounceTimer = Timer(const Duration(milliseconds: 500), () {
      widget.onSearch?.call(query);
    });
  }

  @override
  void dispose() {
    debounceTimer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: widget.padding,
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.xs),
        decoration: BoxDecoration(
            color: widget.showBackground
                ? dark
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: widget.showBorder ? Border.all(color: TColors.grey) : null),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Icon(widget.icon, color: TColors.grey),
              hintText: 'Encuentra lugares turisticos',
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        controller.clear();
                        widget.onSearch?.call('');
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ))
                  : null
              // border: InputBorder.none,
              ),
          onChanged: onChanges,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
