import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/enums.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/utils/constants/colors.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon(
      {super.key,
      required this.title,
      this.maxline = 1,
      this.iconColor = TColors.primary,
      this.textcolor,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  final String title;
  final int maxline;
  final Color? textcolor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            color: textcolor,
            maxline: maxline,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}

class TBrandTitleText extends StatelessWidget {
  const TBrandTitleText(
      {super.key,
      this.color,
      required this.title,
      this.maxline = 1,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  final Color? color;
  final String title;
  final int maxline;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        maxLines: maxline,
        overflow: TextOverflow.ellipsis,
        style: brandTextSize == TextSizes.small
            ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
            : brandTextSize == TextSizes.medium
                ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
                : brandTextSize == TextSizes.large
                    ? Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(color: color)
                    : Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: color));
  }
}
