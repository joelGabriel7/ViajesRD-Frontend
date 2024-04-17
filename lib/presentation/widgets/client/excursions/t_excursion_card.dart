import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/helpers/t_shadow_styles.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/presentation/widgets/client/Banner/t_rounded_banner.dart';
import 'package:viajes/presentation/widgets/client/containers/t_rounded_container.dart';
import 'package:viajes/presentation/widgets/shared/t_product_title_text.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';

class TExcursionCardVertical extends StatelessWidget {
  const TExcursionCardVertical({super.key, required this.excursion});
  final Excursion excursion;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    String urlbase = excursion.touristPlaces.images.isNotEmpty
        ? 'https://apiviajesrd.info/${excursion.touristPlaces.images[0].imageUrl}'
        : 'https://cdn.dribbble.com/users/760347/screenshots/7341673/loading_ps.gif';

    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyles.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white),
        child: Column(children: [
          Expanded(
            child: TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //* Images
                  TRoundedBanner(
                    height: size.height * 0.3,
                    isNetworkImage: true,
                    imageUrl: urlbase,
                    applyImageRadius: true,
                  ),
                  //* Discount or Special Offer Badge (Optional)
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25% Off', // Ejemplo de descuento
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //* Details
          Padding(
            padding: const EdgeInsets.only(left: TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TProductTitleText(
                  title: excursion.touristPlaces.name,
                  smallSize: true,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                Row(
                  children: [
                    Text(
                      '\$${excursion.price.toStringAsFixed(2)}', // Mostrando el precio
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: TColors.primary),
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwItems / 2,
                    ),
                    const Icon(
                      Iconsax.money_recive,
                      color: TColors.primary,
                      size: TSizes.iconXs,
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
