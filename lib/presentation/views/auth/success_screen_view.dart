import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/config/helpers/spacing_styles.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';

class SuccessScreenView extends StatelessWidget {
  const SuccessScreenView(
      {super.key,
      required this.images,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final String images, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => context.push('/login'),
                icon: const Icon(Icons.close_rounded))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                //* images
                Image(
                  image: AssetImage(images),
                  width: THelperFunctions.screenWidth(context) * 0.8,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                //* titles & Subtitle
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections - 15,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                //* Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      child: const Text(TTexts.tContinue)),
                )
              ],
            ),
          ),
        ));
  }
}
