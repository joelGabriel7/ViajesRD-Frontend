import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
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
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController(); // Correctamente movida fuera de build

  @override
  void initState() {
    super.initState();
    _selectedRole = widget.selectedRole; // Inicializa aquí, fuera de build
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
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
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          //* password
          TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
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
                  try {
                    final userCreate = UserCreateView(ref: ref);
                    await userCreate.createUser(
                        username: _usernameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        role: _selectedRole);
                    if (mounted) {
                      context.push('/succes/account');
                    }
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
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
