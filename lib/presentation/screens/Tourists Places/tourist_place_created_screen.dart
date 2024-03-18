import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/provider/categories/categories_provider.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_place_add_provider.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_place_provider.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_place_update_provider.dart';
import 'package:viajes/presentation/widgets/custom_dropdown.dart';
import 'package:viajes/presentation/widgets/shared/custom_bottom.dart';
import 'package:viajes/presentation/widgets/shared/images_container.dart';
import 'package:viajes/utils/constants/sizes.dart';
import '../../widgets/shared/custom_field_form.dart';

class TouristPlacesCreateScreen extends StatelessWidget {
  final int? touristPlace;
  const TouristPlacesCreateScreen({super.key, this.touristPlace});

  @override
  Widget build(BuildContext context) {
    return PlaceCreateForm(
      placeId: touristPlace,
    );
  }
}

class PlaceCreateForm extends ConsumerStatefulWidget {
  final int? placeId;
  const PlaceCreateForm({super.key, this.placeId});

  @override
  PlaceCreateFormState createState() => PlaceCreateFormState();
}

class PlaceCreateFormState extends ConsumerState<PlaceCreateForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  int selectedCategoryId = 1;
  List<File> images = [];

  @override
  void initState() {
    super.initState();

    ref.read(getAllCategoryProvider.notifier).loadNextPage();
    if (widget.placeId != null) {
      Future.microtask(() =>
          ref.read(placeInfoProvider.notifier).loadPlace(widget.placeId!));
    }
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
      } else {}
    } catch (e) {
      return ('Error al seleccionar imágenes: $e');
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
    final placeDetails = ref.watch(placeInfoProvider);
    final placeUpdate = ref.read(touristPlaceUpdateProvider.notifier);

    String buttonText = widget.placeId == null
        ? 'Crear Lugar Turístico'
        : 'Actualizar Lugar Turístico';
    final isUpdating = widget.placeId != null;

    if (widget.placeId != null && placeDetails.containsKey(widget.placeId)) {
      final details = placeDetails[widget.placeId] as TouristPlaces;
      nameController.text = details.name;
      descriptionController.text = details.description;
      locationController.text = details.location;
      selectedCategoryId = details.categoryId;
    }

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
              Text(
                  isUpdating
                      ? TTexts.touristPlaceUpdateTitle
                      : TTexts.touristPlaceTitle,
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
                    key: ValueKey(selectedCategoryId),
                    categories: categories,
                    initialValue: selectedCategoryId.toString(),
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
                    text: buttonText,
                    press: () {
                      if (state.status != AddTouristPlaceStatus.loading) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          animType: AnimType.bottomSlide,
                          title: 'Confirmación',
                          desc:
                              '¿Estás seguro de que quieres crear esta zona turística?',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () async {
                            if (isUpdating) {
                              await placeUpdate.updateTouristPlace(
                                id: widget.placeId!,
                                name: nameController.text,
                                description: descriptionController.text,
                                location: locationController.text,
                                categoryId: selectedCategoryId,
                              );
                            } else {
                              await notifier.addTouristPlaceAndUploadImages(
                                name: nameController.text,
                                description: descriptionController.text,
                                location: locationController.text,
                                categoryId: selectedCategoryId,
                                images: images,
                              );
                            }

                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'El lugar turístico se ha creado correctamente y se han subido las imagen.'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                              context.pop();
                            }
                          },
                        ).show();
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
