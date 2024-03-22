import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/constants/image_strings.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/presentation/views/auth/success_screen_view.dart';

class SuccessAccountCreated extends StatelessWidget {
  const SuccessAccountCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessScreenView(
        images: TImages.staticSuccessIllustration,
        title: TTexts.yourAccountCreatedTitle,
        subtitle: TTexts.yourAccountCreatedSubTitle,
        onPressed: () => context.push('/login'));
  }
}
