import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:viajes/config/router/app_router.dart';
import 'package:viajes/config/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Asegúrate de que AppTheme tiene configuraciones para el tema oscuro
    final appTheme = AppTheme();

    return GetMaterialApp.router(
      routerDelegate: appRouter.routerDelegate,
      routeInformationParser: appRouter.routeInformationParser,
      routeInformationProvider: appRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme:
          appTheme.getTheme(selectedColor: 0, isDarkMode: false), // Tema claro
      // darkTheme:appTheme.getTheme(selectedColor: 0, isDarkMode: true), // Tema oscuro
      // Usar el tema basado en la configuración del dispositivo
    );
  }
}
