import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/provider/excursions/excursions_provider.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_place_provider.dart';
import 'package:viajes/presentation/widgets/shared/components/places_images.dart';
import 'package:viajes/presentation/widgets/shared/t_product_title_text.dart';

class PlaceScreen extends ConsumerStatefulWidget {
  const PlaceScreen({super.key, required this.placeId});

  final int placeId;

  @override
  PlaceScreenState createState() => PlaceScreenState();
}

class PlaceScreenState extends ConsumerState<PlaceScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(placeInfoProvider.notifier).loadPlace(widget.placeId);
  }

  @override
  Widget build(BuildContext context) {
    final TouristPlaces? place = ref.watch(placeInfoProvider)[widget.placeId];
    if (place == null) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ** Places Images and slider */
            PlaceImages(base: 'https://apiviajesrd.info/', places: place),
            //* Places Body */
            TPlaceMetadata(
                place: place,
                location: place.location,
                title: place.name,
                description: place.description,
                categoryName: place.category.name),
          ],
        ),
      ),
    );
  }
}

class TPlaceMetadata extends ConsumerWidget {
  const TPlaceMetadata({
    super.key,
    required this.place,
    required this.location,
    required this.title,
    required this.description,
    required this.categoryName,
  });
  final TouristPlaces place;
  final String location, title, description, categoryName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Note the addition of WidgetRef here
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Nombre - ',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Expanded(
                  child: TProductTitleText(
                title: title,
                smallSize: true,
              )),
            ],
          ),
          const SizedBox(height: TSizes.defaultSpace),
          Row(
            children: [
              Text('Ubicación - ',
                  style: Theme.of(context).textTheme.titleSmall),
              Expanded(
                  child: TProductTitleText(title: location, smallSize: true)),
            ],
          ),
          const SizedBox(height: TSizes.defaultSpace),
          TProductTitleText(
            title: description,
            smallSize: true,
            maxlines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: TSizes.defaultSpace),
          Row(
            children: [
              Text('Categoria - ',
                  style: Theme.of(context).textTheme.titleSmall),
              Expanded(
                  child:
                      TProductTitleText(title: categoryName, smallSize: true)),
            ],
          ),
          const SizedBox(height: TSizes.defaultSpace),
          const Divider(color: TColors.accent, thickness: 1),
          const SizedBox(height: TSizes.spaceBtwSections / 1.5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                // En el onPressed del ElevatedButton
                onPressed: () async {
                  Excursion? excursion = await ref
                      .read(excursionsProvider.notifier)
                      .getExcursionByTouristPlaceId(place.id);
                  if (excursion != null) {
                    if (ref
                        .read(cartProvider.notifier)
                        .isExcursionInCart(excursion.id ?? 0)) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Esta excursión ya está en el carrito')),
                      );
                    } else {
                      ref
                          .read(cartProvider.notifier)
                          .addToCart(CartItem(excursion: excursion));
                    }
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Excursión agregada al carrito')));
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'No se encontró la excursión para este lugar')));
                  }
                },
                child: const Text('Agregar al carrito')),
          ),
        ],
      ),
    );
  }
}


// ElevatedButton(
//               onPressed: () {
//                 if (ref
//                     .read(cartProvider.notifier)
//                     .isExcursionInCart(excursion.id ?? 0)) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                         content: Text('Esta excursión ya está en el carrito')),
//                   );
//                 } else {
//                   ref
//                       .read(cartProvider.notifier)
//                       .addToCart(CartItem(excursion: excursion));
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                         content: Text(
//                             'Excursión ${excursion.touristPlaces!.name} agregada al carrito')),
//                   );
//                 }
//               },
//               child: const Text('Agregar al carrito'),