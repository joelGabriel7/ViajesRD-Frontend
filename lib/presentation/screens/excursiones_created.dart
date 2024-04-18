import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/helpers/auth/decode_token.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/provider/excursions/excursions_created.dart';

class CreateExcursionForm extends ConsumerStatefulWidget {
  final TouristPlaces places;

  const CreateExcursionForm({super.key, required this.places});

  @override
  CreateExcursionFormState createState() => CreateExcursionFormState();
}

class CreateExcursionFormState extends ConsumerState<CreateExcursionForm> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _availablePlacesController =
      TextEditingController();
  void _createExcursion() async {
    if (_formKey.currentState!.validate()) {
      debugPrint("Form validated");
      final agencyId = await TokenService().getAgencyId();
      debugPrint("Agency ID: $agencyId");

      final dateExcursion = DateTime.now();
      final formatter = DateFormat('yyyy-MM-dd');
      final formattedDate = formatter.format(dateExcursion);

      try {
        Excursion newExcursion = Excursion(
          agencyId: agencyId ?? 0,
          touristPlaceId: widget.places.id,
          dateExcursion: DateTime.parse(formattedDate),
          durationExcursion: 0,
          price: double.parse(_priceController.text),
          description: _descriptionController.text,
          availablePlaces: int.parse(_availablePlacesController.text),
        );

        await ref
            .read(excursionNotifierProvider.notifier)
            .createExcursion(newExcursion);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Excursión creada con éxito!')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al crear la excursión: $e')),
          );
        }
      }
    } else {
      debugPrint("Form validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'Este campo es requerido' : null,
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción'),
              validator: (value) =>
                  value!.isEmpty ? 'Este campo es requerido' : null,
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              controller: _availablePlacesController,
              decoration:
                  const InputDecoration(labelText: 'Plazas disponibles'),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value!.isEmpty ? 'Este campo es requerido' : null,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _createExcursion,
                child: const Text('Crear excursión'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
