import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/presentation/provider/users/auth/auth_login_provider.dart';
import 'package:viajes/presentation/views/auth/login_view.dart';

class VLoginForm extends ConsumerStatefulWidget {
  const VLoginForm({
    super.key,
  });

  @override
  VLoginFormState createState() => VLoginFormState();
}

class VLoginFormState extends ConsumerState<VLoginForm> {
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          //* Username
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user), labelText: TTexts.username),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            //* password
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            ///* Remember me & Forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),

            //* Sign in Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final authServices = LoginView(ref: ref);
                    final isSuccess = await authServices.login(
                        username: _usernameController.text,
                        password: _passwordController.text);
                    if (!isSuccess && mounted) {
                      final errorMessage =
                          ref.read(authLoginNotifierProvider).errorMessage;
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(errorMessage)));
                    } else {
                      // ignore: use_build_context_synchronously
                      context.push('/succes/account');
                    }
                  },
                  child: const Text(TTexts.signIn),
                )),
            const SizedBox(height: TSizes.spaceBtwItems),
            // //* Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    context.push('/signup');
                  },
                  child: const Text(TTexts.createAccount),
                )),
            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
