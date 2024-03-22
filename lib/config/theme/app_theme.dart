import 'package:flutter/material.dart';
import 'package:viajes/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:viajes/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:viajes/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:viajes/utils/theme/widget_themes/text_field_theme.dart';
import 'package:viajes/utils/theme/widget_themes/text_theme.dart';

import '../constants/constants.dart';

const colorList = <Color>[
  Colors.blue,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0, 'Color must be greather then 0'),
        assert(selectedColor < colorList.length,
            'The color must be less o equal a ${colorList.length - 1}');

  ThemeData getTheme({required int selectedColor, required bool isDarkMode}) =>
      ThemeData(
          fontFamily: 'Poppins',
          brightness: isDarkMode ? Brightness.dark : Brightness.light,
          cardTheme: const CardTheme(color: Colors.white),
          colorSchemeSeed: colorList[selectedColor],
          appBarTheme: appBarTheme(selectedColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TTextTheme.lightTextTheme,
          outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
          inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
          checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
          elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme);

  TextTheme textTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(color: kTextColor, fontSize: 12),
      bodyMedium: TextStyle(color: kTextColor),
      titleLarge: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    );
  }

  AppBarTheme appBarTheme(int selectedColor) {
    return AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: colorList[selectedColor]),
    );
  }

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
