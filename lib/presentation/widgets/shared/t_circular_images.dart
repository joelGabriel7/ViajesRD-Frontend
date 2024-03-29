import 'package:flutter/material.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';

class TCircularImages extends StatelessWidget {
  const TCircularImages(
      {super.key,
      this.fit = BoxFit.cover,
      required this.image,
      required this.isNetworkImage,
      this.overlayColor,
      this.backgroundColor,
      required this.width,
      required this.height,
      this.padding = TSizes.sm});

  final BoxFit fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor ??
              (THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Image(
            image: isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider,
            fit: fit,
            color: overlayColor,
          ),
        ));
  }
}
