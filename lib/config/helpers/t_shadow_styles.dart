import 'package:flutter/material.dart';
import 'package:viajes/config/constants/colors.dart';

class TShadowStyles {
  static final verticalProductShadow = BoxShadow(
      color: TColors.darkerGrey.withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 50,
      spreadRadius: 7);
  static final horizontalProductShadow = BoxShadow(
      color: TColors.darkerGrey.withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 50,
      spreadRadius: 7);
}
