import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  ThemeData getTheme() => ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // brightness: Brightness.,
      );
}
