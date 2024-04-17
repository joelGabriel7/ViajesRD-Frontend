import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/helpers/t_shadow_styles.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/widgets/client/Banner/t_rounded_banner.dart';
import 'package:viajes/presentation/widgets/client/containers/t_rounded_container.dart';
import 'package:viajes/presentation/widgets/shared/t_product_title_text.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.place});
  final TouristPlaces place;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    String urlbase = place.images.isNotEmpty
        ? 'https://apiviajesrd.info/${place.images[0].imageUrl}'
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
              // height: 130,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //* Images
                  TRoundedBanner(
                    // width: size.width * 0.9,
                    height: size.height * 0.3,
                    isNetworkImage: true,
                    imageUrl: urlbase,
                    applyImageRadius: true,
                    // isNetworkImage: true,
                  ),
                  //* Name zone
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
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
                  title: place.name,
                  smallSize: true,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        place.location,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.xs,
                    ),
                    const Icon(
                      Iconsax.verify5,
                      color: TColors.primary,
                      size: TSizes.iconXs,
                    )
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
