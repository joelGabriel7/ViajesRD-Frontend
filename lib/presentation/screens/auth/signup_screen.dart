import 'package:flutter/material.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/presentation/widgets/auth/signup/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedRole = 'agency';
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //*Form
              SignupForm(selectedRole: selectedRole),
            ],
          ),
        ),
      ),
    );
  }
}
