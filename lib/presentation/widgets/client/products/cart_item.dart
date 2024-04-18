import 'package:flutter/material.dart';
import 'package:viajes/config/constants/enums.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/presentation/widgets/client/Banner/t_rounded_banner.dart';
import 'package:viajes/presentation/widgets/texts/brand_tittle.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        TRoundedBanner(
          isNetworkImage: true,
          imageUrl: cartItem
                  .excursion.touristPlaces.images.first.imageUrl.isNotEmpty
              ? 'https://apiviajesrd.info/${cartItem.excursion.touristPlaces.images[0].imageUrl}'
              : 'https://th.bing.com/th/id/OIP.NtlX1xnmpCVssKBag3XPNAHaFj?rs=1&pid=ImgDetMain',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
        ),

        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        //* Title, prices and quantity
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleWithVerifiedIcon(
                title: cartItem.excursion.touristPlaces.name,
              ),
              TBrandTitleText(
                  title:
                      'Cupos disponibles: ${cartItem.excursion.availablePlaces}',
                  brandTextSize: TextSizes.medium),
              //* Atributtes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Ubicacion: ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: cartItem.excursion.touristPlaces.location,
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
