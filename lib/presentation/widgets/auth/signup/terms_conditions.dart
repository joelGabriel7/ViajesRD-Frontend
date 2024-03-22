import 'package:flutter/material.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/constants/text_strings.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(
          width: TSizes.spaceBtwItems - 12,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${TTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${TTexts.privacyPolicy} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        decoration: TextDecoration.underline,
                        decorationColor: TColors.primary,
                      )),
              TextSpan(
                  text: '${TTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: TTexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        decoration: TextDecoration.underline,
                        decorationColor: TColors.primary,
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
