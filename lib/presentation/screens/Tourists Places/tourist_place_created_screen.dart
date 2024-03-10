import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/presentation/provider/categories/categories_provider.dart';
import 'package:viajes/presentation/widgets/custom_dropdown.dart';
import 'package:viajes/presentation/widgets/shared/custom_bottom.dart';
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
  List<File> images = [];

  @override
  void initState() {
    super.initState();
    ref.read(getAllCategoryProvider.notifier).loadNextPage();
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
        print('No se seleccionó ninguna imagen');
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
                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.touristPlaceName,
                        prefixIcon: Icon(Icons.place)),
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwInputFields,
                  ),

                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.touristPlaceDescription,
                        prefixIcon: Icon(Icons.description)),
                  ),
                  // Location
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),

                  TextFormField(
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.touristPlaceLocation,
                        prefixIcon: Icon(Icons.add_location_alt)),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),

                  CustomDropdownFormField(categories: categories),

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
                      child: DefaultButton(
                          text: 'Crea un lugar turistico', press: () {})),
                ],
              ))
            ]),
          ),
        ));
  }
}
