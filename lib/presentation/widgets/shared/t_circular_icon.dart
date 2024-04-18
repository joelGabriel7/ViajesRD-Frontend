import 'package:flutter/material.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/sizes.dart';

class TCircularICon extends StatelessWidget {
  const TCircularICon(
      {super.key,
      this.width,
      this.height,
      this.size = TSizes.lg,
      required this.icon,
      this.color,
      this.onPressed,
      this.backgroundColor});

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
            ? backgroundColor!
            : TColors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
          onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}
