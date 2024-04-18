import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/presentation/provider/excursions/excursions_info_provider.dart';
import 'package:viajes/presentation/provider/excursions/excursions_provider.dart';
import 'package:viajes/presentation/widgets/shared/excursions_images.dart';
import 'package:viajes/presentation/widgets/shared/t_product_title_text.dart';

class ExcursionScreen extends ConsumerStatefulWidget {
  const ExcursionScreen({super.key, required this.excursionId});

  final int excursionId;

  @override
  _ExcursionScreenState createState() => _ExcursionScreenState();
}

class _ExcursionScreenState extends ConsumerState<ExcursionScreen> {
  @override
  void initState() {
    super.initState();
    ref
        .read(excursionInfoProvider.notifier)
        .loadExcursion(widget.excursionId.toString());
  }

  @override
  Widget build(BuildContext context) {
    final Excursion? excursion =
        ref.watch(excursionInfoProvider)[widget.excursionId.toString()];

    if (excursion == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExcursionImages(
              base: 'https://apiviajesrd.info/',
              excursion: excursion,
            ),
            TExcursionMetadata(excursion: excursion),
          ],
        ),
      ),
    );
  }
}

class TExcursionMetadata extends ConsumerWidget {
  const TExcursionMetadata({
    super.key,
    required this.excursion,
  });

  final Excursion excursion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TProductTitleText(
            title: 'Nombre - ${excursion.touristPlaces.name}',
          ),
          const SizedBox(height: TSizes.defaultSpace),
          TProductTitleText(
            title: 'Ubicación - ${excursion.touristPlaces.location}',
          ),
          const SizedBox(height: TSizes.defaultSpace),
          TProductTitleText(
            title:
                'Fecha - ${excursion.dateExcursion.day}/${excursion.dateExcursion.month}/${excursion.dateExcursion.year}',
            maxlines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: TSizes.defaultSpace),
          TProductTitleText(
            title: 'Precio - \$${excursion.price.toStringAsFixed(2)}',
          ),
          const SizedBox(height: TSizes.spaceBtwSections / 1.5),
          const Divider(color: TColors.accent, thickness: 1),
          const SizedBox(height: TSizes.spaceBtwSections / 1.5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(cartProvider.notifier)
                      .addToCart(CartItem(excursion: excursion));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Excursión ${excursion.touristPlaces.name} agregada al carrito')),
                  );
                },
                child: const Text('Agregar al carrito')),
          )
        ],
      ),
    );
  }
}
