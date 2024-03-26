import 'package:flutter/material.dart';
import 'package:viajes/config/helpers/spacing_styles.dart';
import 'package:viajes/presentation/widgets/auth/login/form_login.dart';
import 'package:viajes/presentation/widgets/auth/login/login_header.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(children: [
            //* Logo, Title & Subtitle
            VLoginHeader(dark: dark),
            //* Form
            const VLoginForm(),
          ]),
        ),
      ),
    );
  }
}
