import 'package:flutter/material.dart';
import 'package:viajes/config/constants/enums.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/domain/entity/category.dart';
import 'package:viajes/presentation/widgets/client/Banner/t_circular_images.dart';
import 'package:viajes/presentation/widgets/client/containers/t_rounded_container.dart';
import 'package:viajes/presentation/widgets/texts/brand_tittle.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.image,
    required this.category,
  });

  final String image;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //* Icon
            Flexible(
              child: TCircularImages(
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                image: image,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            //* text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandTitleWithVerifiedIcon(
                    title: category.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    category.description,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
