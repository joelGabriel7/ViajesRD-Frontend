import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/constants.dart';
import 'package:viajes/config/constants/enums.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/config/helpers/auth/decode_token.dart';
import 'package:viajes/presentation/provider/users/auth/auth_login_provider.dart';
import 'package:viajes/presentation/views/auth/login_view.dart';
import 'package:viajes/presentation/widgets/shared/custom_snackbar.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';
import 'package:viajes/config/helpers/user_services.dart';

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

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _attemptLogin() async {
    if (validateForm()) {
      setState(() => _isLoading = true); // Inicia la animación

      final isSuccess = await LoginView(ref: ref).login(
        username: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      );

      setState(() => _isLoading == false);

      if (isSuccess) {
        final userRole = await TokenService.getRole();

        final profileCompleted = await UserProfileService.isProfileCompleted();

        if (userRole == 'agency' && !profileCompleted && mounted) {
          context.go('/agency/new');
          await UserProfileService.markProfileAsCompleted();
        } else {
          navigateBasedOnUserRole(userRole);
        }
      } else if (mounted) {
        final errorMessage =
            ref.read(authLoginNotifierProvider.notifier).lastErrorMessage;
        showCustomSnackBar(
          context: context,
          message: errorMessage,
          actionLabel: "Reintentar",
          onActionPressed: () {},
          backgroundColor: TColors.error,
          icon: const Icon(
            Icons.error,
            color: TColors.white,
          ),
        );
      }
    }
  }

  void navigateBasedOnUserRole(String userRole) {
    switch (userRole) {
      case "agency":
        context.go('/home/0');
        break;
      case "client":
        context.go('/home/client');
        break;
      default:
        context.go('/login');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (_isLoading)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 5),
            child: Lottie.asset(
              'assets/images/animations/Animation_loader.json',
              width: THelperFunctions.screenWidth(context) * 0.8,
              height: THelperFunctions.screenHeight(context) * 0.30,
            ),
          ),
        Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
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
                        icon: Icon(_isPassowrdoVisible
                            ? Iconsax.eye
                            : Iconsax.eye_slash),
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
                        await _attemptLogin();
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
        )
      ],
    );
  }

  bool validateForm() {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
