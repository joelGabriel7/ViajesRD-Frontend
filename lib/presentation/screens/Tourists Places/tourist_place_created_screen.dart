import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/presentation/provider/categories/categories_provider.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_place_add_provider.dart';
import 'package:viajes/presentation/widgets/custom_dropdown.dart';
import 'package:viajes/presentation/widgets/shared/custom_bottom.dart';
import 'package:viajes/presentation/widgets/shared/images_container.dart';
import 'package:viajes/utils/constants/sizes.dart';
import '../../widgets/shared/custom_field_form.dart';

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
                  DefaultButton(
                    text: state.status == AddTouristPlaceStatus.loading
                        ? 'Cargando...'
                        : 'Crea un lugar turístico',
                    press: () async {
                      if (state.status != AddTouristPlaceStatus.loading) {
                        // Llamar al método addTouristPlaceAndUploadImages con los datos del formulario
                        await notifier.addTouristPlaceAndUploadImages(
                          name: nameController.text,
                          description: descriptionController.text,
                          location: locationController.text,
                          categoryId:
                              selectedCategoryId, // Asegúrate de tener esta variable correctamente actualizada
                          images: images,
                        );

                        if (mounted) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.info,
                            animType: AnimType.bottomSlide,
                            borderSide: const BorderSide(
                                color: TColors.borderPrimary, width: 2),
                            title: 'Lugar turístico creado',
                            desc:
                                'El lugar turístico se ha creado correctamente y se han subido las imagen.',
                            autoHide: const Duration(seconds: 3),
                            onDismissCallback: (_) {
                              context.pop();
                            },
                            btnOkOnPress: () {
                              context.pop();
                            },
                            btnOkIcon: Icons.check_circle,
                            customHeader: const Icon(
                              Icons.place, // Elige el ícono adecuado
                              size: 30, // Ajusta el tamaño según necesites
                              color: Colors
                                  .blue, // O cualquier color que prefieras
                            ),
                            showCloseIcon: true,
                            width: 500,
                          ).show();
                        }
                      }
                    },
                  ),
                ],
              ))
            ]),
          ),
        ));
  }
}
