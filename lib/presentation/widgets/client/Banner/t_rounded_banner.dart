import 'package:flutter/material.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/sizes.dart';

class TRoundedBanner extends StatelessWidget {
  const TRoundedBanner({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onpressed,
    this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onpressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? FadeInImage.assetNetwork(
                  placeholder:
                      'assets/images/loading.gif', // Imagen de carga local
                  image: imageUrl, // URL de la imagen de red
                  fit: fit,
                  fadeInDuration: const Duration(
                      milliseconds: 200), // Duración de la animación de fadeIn
                  placeholderScale:
                      0.5, // Si la imagen de carga necesita escalarse
                )
              : Image.asset(
                  imageUrl, // Imagen local
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
