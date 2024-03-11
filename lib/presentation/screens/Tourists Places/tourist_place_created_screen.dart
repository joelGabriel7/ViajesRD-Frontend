import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/presentation/provider/categories/categories_provider.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_place_add_provider.dart';
import 'package:viajes/presentation/widgets/custom_dropdown.dart';
import 'package:viajes/presentation/widgets/shared/images_container.dart';
import 'package:viajes/utils/constants/sizes.dart';

class TouristPlacesCreateScreen extends StatelessWidget {
  const TouristPlacesCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceCreateForm();
  }
}

class PlaceCreateForm extends ConsumerStatefulWidget {
  const PlaceCreateForm({
    super.key,
  });

  @override
  PlaceCreateFormState createState() => PlaceCreateFormState();
}

class PlaceCreateFormState extends ConsumerState<PlaceCreateForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  late final int selectedCategoryId;
  List<File> images = [];

  @override
  void initState() {
    super.initState();
    ref.read(getAllCategoryProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    super.dispose();
  }

  Future pickImages() async {
    try {
      final List<XFile> pickedFiles = await ImagePicker().pickMultiImage(
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 80,
      );
      if (pickedFiles.isNotEmpty) {
        setState(() {
          images.addAll(pickedFiles.map((pickedFile) => File(pickedFile.path)));
        });
      } else {
        // Mostrar un mensaje o manejar la ausencia de selección de imagen
      }
    } catch (e) {
      // Si se presenta algún error
    }
  }

  void removeImage(int index) {
    setState(() {
      images.removeAt(index); // Elimina la imagen en el índice dado
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(touristPlaceAddProvider);
    final notifier = ref.read(touristPlaceAddProvider.notifier);
    final categories = ref.watch(getAllCategoryProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Zonas Turisticas',
          ),
        ),
        body: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              //*TItle
              Text(TTexts.touristPlaceTitle,
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //* Form

              Form(
                  child: Column(
                children: [
                  CustomFieldForm(
                    textController: nameController,
                    labelText: TTexts.touristPlaceName,
                    icons: Icons.place,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),
                  CustomFieldForm(
                    textController: descriptionController,
                    labelText: TTexts.touristPlaceDescription,
                    icons: Icons.description,
                  ),
                  // Location
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  CustomFieldForm(
                    textController: locationController,
                    labelText: TTexts.touristPlaceLocation,
                    icons: Icons.add_location_alt,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  CustomDropdownFormField(
                    categories: categories,
                    onSelected: (String? value) {
                      setState(() {
                        if (value != null) {
                          selectedCategoryId = int.tryParse(value)!;
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),

                  //* Images
                  ImagesContainer(
                    press: pickImages,
                    images: images,
                    onRemove: removeImage,
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  //* Button

                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Llamar al método addTouristPlaceAndUploadImages con los datos del formulario
                          await notifier.addTouristPlaceAndUploadImages(
                            name: nameController.text,
                            description: descriptionController.text,
                            location: locationController.text,
                            categoryId:
                                selectedCategoryId, // Asegúrate de tener esta variable correctamente actualizada
                            images: images,
                          );
                        },
                        child: state.status == AddTouristPlaceStatus.loading
                            ? const CircularProgressIndicator()
                            : const Text('Crea un lugar turístico'),
                      ))
                ],
              ))
            ]),
          ),
        ));
  }
}

class CustomFieldForm extends StatelessWidget {
  const CustomFieldForm({
    super.key,
    required this.textController,
    required this.labelText,
    required this.icons,
  });

  final TextEditingController textController;
  final String labelText;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      expands: false,
      decoration:
          InputDecoration(labelText: labelText, prefixIcon: Icon(icons)),
    );
  }
}
