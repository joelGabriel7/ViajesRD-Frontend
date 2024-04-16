import 'package:flutter/material.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/image_strings.dart';
import 'package:viajes/config/helpers/maps_categories.dart';
import 'package:viajes/utils/constants/sizes.dart';

class TVerticalImagenText extends StatelessWidget {
  const TVerticalImagenText({
    super.key,
    required this.categoryName,
    required this.text,
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap,
  });

  final String categoryName, text;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String image = categoryImages[categoryName] ?? TImages.beachIcon;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //* Circular icon
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: TColors.dark,
                ),
              ),
            ),
            //* Text
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
