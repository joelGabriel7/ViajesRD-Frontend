import 'package:flutter/material.dart';

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
          brightness: isDarkMode ? Brightness.dark : Brightness.light,
          cardTheme: const CardTheme(color: Colors.white),
          colorSchemeSeed: colorList[selectedColor],
          appBarTheme: const AppBarTheme(centerTitle: true));

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
