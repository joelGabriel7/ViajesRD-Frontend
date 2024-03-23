import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/constants.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  bool _isPassowrdoVisible = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // No olvides limpiar los controladores
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          //* Username
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.user),
                labelText: TTexts.username,
                suffixIcon: _usernameController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          _usernameController.clear();
                          setState(() {});
                        },
                        child: const Icon(Icons.close),
                      )
                    : null,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return kUsernamelNullError; // Mensaje de validación
                }
                return null;
              },
              onChanged: (value) {
                setState(() {});
                _formKey.currentState?.validate();
              },
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            //* password
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPassowrdoVisible,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPassowrdoVisible = !_isPassowrdoVisible;
                      });
                    },
                    icon: Icon(
                        _isPassowrdoVisible ? Iconsax.eye : Iconsax.eye_slash),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return kPassNullError; // Mensaje de validación
                }
                return null;
              },
              onChanged: (value) {
                _formKey.currentState?.validate();
              },
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
                    if (validateForm()) {
                      final authServices = LoginView(ref: ref);
                      final isSuccess = await authServices.login(
                          username: _usernameController.text.trim(),
                          password: _passwordController.text.trim());

                      if (!isSuccess && mounted) {
                        final errorMessage =
                            ref.read(authLoginNotifierProvider).errorMessage;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                const Icon(Icons.error,
                                    color: Colors.white), // Añade un icono
                                const SizedBox(width: 10),
                                Expanded(
                                  // Hace que el texto sea flexible
                                  child: Text(
                                    errorMessage,
                                    overflow: TextOverflow
                                        .ellipsis, // Añade elipsis si el texto es demasiado largo
                                  ),
                                ),
                              ],
                            ),
                            backgroundColor: TColors.error,
                            action: SnackBarAction(
                              label: 'Reintentar',
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                            behavior: SnackBarBehavior
                                .floating, // Hace que el SnackBar sea flotante
                            margin: const EdgeInsets.all(
                                8), // Añade márgenes alrededor del SnackBar para más espacio
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20), // Añade bordes redondeados al SnackBar
                            ),
                          ),
                        );
                      } else {
                        // ignore: use_build_context_synchronously
                        context.push('/succes/login');
                      }
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

  bool validateForm() {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
