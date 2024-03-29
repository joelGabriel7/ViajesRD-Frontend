import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/sizes.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.onButtonPressed,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final VoidCallback onButtonPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSizes.defaultSpace / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Expanded(
            //   child: Icon(
            //     icon,
            //     size: 18,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
