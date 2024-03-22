import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/presentation/widgets/auth/signup/terms_conditions.dart';

class SignupForm extends StatefulWidget {
  final String selectedRole;

  const SignupForm({
    super.key,
    required this.selectedRole,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late String _selectedRole; // Correctamente movida fuera de build

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
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          //* User
          TextFormField(
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
          TermsConditionsScreen(),

          //* signup Button
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(TTexts.createAccount),
              ))
        ],
      ),
    );
  }
}
