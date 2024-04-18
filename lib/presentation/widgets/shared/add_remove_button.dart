import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/presentation/widgets/shared/t_circular_icon.dart';

class TCartItemQuantityWithAddRemove extends StatelessWidget {
  const TCartItemQuantityWithAddRemove({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onRemove,
          child: const TCircularICon(
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: TColors.black,
              backgroundColor: TColors.light),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        GestureDetector(
          onTap: onAdd,
          child: const TCircularICon(
              icon: Iconsax.add,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: TColors.white,
              backgroundColor: TColors.primary),
        ),
      ],
    );
  }
}
