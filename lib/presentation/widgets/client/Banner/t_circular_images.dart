import 'package:flutter/material.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';

class TCircularImages extends StatelessWidget {
  const TCircularImages({
    super.key,
    this.width = 35,
    this.height = 35,
    this.padding = TSizes.sm,
    required this.image,
    this.backgroundColor,
    this.overlayColor,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
  });

  final double width, height, padding;
  final String image;
  final Color? backgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor ??
              (THelperFunctions.isDarkMode(context)
                  ? TColors.dark
                  : TColors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
            color: overlayColor,
          ),
        ));
  }
}
