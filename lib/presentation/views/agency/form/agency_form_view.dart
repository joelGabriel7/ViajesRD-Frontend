import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/presentation/provider/agency/angecy_info_provider.dart';
import 'package:viajes/presentation/views/agency/form/agency_create_view.dart';
import 'package:viajes/presentation/views/auth/user_created_view.dart';
import 'package:viajes/presentation/widgets/logo_picker.dart';
import 'package:viajes/presentation/widgets/shared/custom_field_form.dart';

class AgencyFormView extends StatelessWidget {
  final Map<String, dynamic>? userData;
  const AgencyFormView({super.key, required this.userData});

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
                FormAgency(
                  userData: userData ?? {},
                ),
              ],
            ),
          ),
        ));
  }
}

class FormAgency extends ConsumerStatefulWidget {
  final Map<String, dynamic> userData;
  const FormAgency({
    super.key,
    required this.userData,
  });

  @override
  FormAgencyState createState() => FormAgencyState();
}

class FormAgencyState extends ConsumerState<FormAgency> {
  XFile? _logoImage; // Aquí guardaremos la imagen seleccionada

  void _setLogoImage(XFile? image) {
    setState(() {
      _logoImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameAgency = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController rncController = TextEditingController();

    return Form(
        child: Column(
      children: [
        LogoPicker(onImagePicked: (image) => _setLogoImage(image)),
        const SizedBox(height: TSizes.spaceBtwSections),
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
          controller: rncController,
          labelText: 'RNC',
          icon: Icons.credit_score,
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              final agencyCreate = AgencyCreateView(ref: ref);
              await agencyCreate.createAgency(
                  name: nameAgency.text,
                  address: addressController.text,
                  phone: phoneController.text,
                  email: emailController.text,
                  logo: _logoImage?.path ?? '',
                  rnc: rncController.text);

              await agencyCreate.setAgencybyRnc(rncController.text);

              final agencyState = ref.read(agencyInfoProvider);
              final agency = agencyState[rncController.text];

              if (agency == null) {
                debugPrint(
                    'No se pudo encontrar la agencia con RNC: ${rncController.text}');
                // Manejar este caso adecuadamente
                return;
              }
              final agencyId = agency.id;
              debugPrint('Agencia creada con id: $agencyId');
              try {
                final userCreate = UserCreateView(ref: ref);
                await userCreate.createUser(
                  username: widget.userData['username'],
                  email: widget.userData['email'],
                  password: widget.userData['password'],
                  role: widget.userData['role'],
                  agencyId: agencyId,
                );
              } catch (e, stackTrace) {
                debugPrint('Error al crear la agencia: $e');
                debugPrint('Stack Trace: $stackTrace');
              }
              if (mounted) {
                context.push('/agency/profile/success');
              }
            },
            child: const Text('Guardar'),
          ),
        )
      ],
    ));
  }
}
