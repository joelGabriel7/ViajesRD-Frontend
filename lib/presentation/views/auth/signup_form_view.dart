import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/constants.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/presentation/views/auth/user_created_view.dart';
import 'package:viajes/presentation/widgets/auth/signup/terms_conditions.dart';

class SignupFormView extends ConsumerStatefulWidget {
  final String selectedRole;

  const SignupFormView({
    super.key,
    required this.selectedRole,
  });

  @override
  SignupFormViewState createState() => SignupFormViewState();
}

class SignupFormViewState extends ConsumerState<SignupFormView> {
  late String _selectedRole;
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _confirmPasswordController =
      TextEditingController();
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController(); // Correctamente movida fuera de build
  bool _isPassowrdoVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selectedRole = widget.selectedRole; // Inicializa aquí, fuera de build
  }

  bool validateForm() {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return kEmailNullError;
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                return kInvalidEmailError;
              }
              return null;
            },
            onChanged: (value) {
              _formKey.currentState?.validate();
            },
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          //* User
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return kUsernamelNullError; // Mensaje de validación
              }
              return null;
            },
            onChanged: (value) {
              _formKey.currentState?.validate();
            },
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          //* password
          TextFormField(
            controller: _passwordController,
            obscureText: !_isPassowrdoVisible,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
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
              } else if (value.length < 6) {
                return kShortPassError;
              }
              return null;
            },
            onChanged: (value) {
              _formKey.currentState?.validate();
            },
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          //* confirmed password
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _isPassowrdoVisible,
            decoration: InputDecoration(
              labelText: "Confirm Password",
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isPassowrdoVisible = !_isPassowrdoVisible;
                  });
                },
                icon:
                    Icon(_isPassowrdoVisible ? Iconsax.eye : Iconsax.eye_slash),
              ),
            ),
            validator: (value) {
              if (value != _passwordController.text) {
                return kMatchPassError;
              }
              return null;
            },
            onChanged: (value) {
              _formKey.currentState?.validate();
            },
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          Text(
            'Selecciona que tipo de usuario quieres ser:',
            style: Theme.of(context)
                .textTheme
                .titleSmall, // Ajusta el estilo según tu tema
          ),
          //* Rol selector
          Wrap(
            spacing: 8.0, // Espacio entre chips
            children: List<Widget>.generate(
              2,
              (int index) {
                return ChoiceChip(
                  label: Text(index == 0 ? 'Agencia' : 'Cliente'),
                  selected: _selectedRole == (index == 0 ? 'agency' : 'client'),
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedRole = index == 0 ? 'agency' : 'client';
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections / 2,
          ),
          //* Terms and conditions
          const TermsConditionsScreen(),

          //* signup Button
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (validateForm()) {
                    try {
                      final userCreate = UserCreateView(ref: ref);
                      await userCreate.createUser(
                          username: _usernameController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                          role: _selectedRole);
                      if (mounted) {
                        _usernameController.clear();
                        _emailController.clear();
                        _passwordController.clear();

                        if (_selectedRole == 'agency') {
                          context.push('/agency/new');
                        } else {
                          context.push('/client/new');
                        }
                      }
                    } catch (e) {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      }
                    }
                  }
                },
                child: const Text(TTexts.createAccount),
              ))
        ],
      ),
    );
  }
}
