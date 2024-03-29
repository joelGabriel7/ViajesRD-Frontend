import 'package:flutter/material.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/presentation/widgets/shared/custom_field_form.dart';

class AgencyFormView extends StatelessWidget {
  const AgencyFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.agencyTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                FormAgency(),
              ],
            ),
          ),
        ));
  }
}

class FormAgency extends StatelessWidget {
  const FormAgency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameAgency = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController logoController = TextEditingController();
    final TextEditingController rncController = TextEditingController();

    return Form(
        child: Column(
      children: [
        CustomFieldForm(
          controller: nameAgency,
          labelText: 'Nombre',
          icon: Icons.person,
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        CustomFieldForm(
          controller: addressController,
          labelText: 'Dirección',
          icon: Icons.location_on,
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        CustomFieldForm(
          controller: phoneController,
          labelText: 'Teléfono',
          icon: Icons.phone,
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        CustomFieldForm(
          controller: emailController,
          labelText: 'Correo electrónico',
          icon: Icons.email,
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        CustomFieldForm(
          controller: logoController,
          labelText: 'Logo',
          icon: Icons.image,
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        CustomFieldForm(
          controller: rncController,
          labelText: 'RNC',
          icon: Icons.credit_score,
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Guardar'),
          ),
        )
      ],
    ));
  }
}
