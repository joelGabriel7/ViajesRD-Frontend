import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/enums.dart';
import 'package:viajes/config/constants/image_strings.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/helpers/maps_categories.dart';
import 'package:viajes/presentation/provider/categories/categories_provider.dart';
import 'package:viajes/presentation/widgets/client/Banner/t_circular_images.dart';
import 'package:viajes/presentation/widgets/client/appBar/appbar.dart';
import 'package:viajes/presentation/widgets/client/containers/search_container.dart';
import 'package:viajes/presentation/widgets/client/containers/t_rounded_container.dart';
import 'package:viajes/presentation/widgets/client/products/cart_menu_item.dart';
import 'package:viajes/presentation/widgets/shared/gridview_layout.dart';
import 'package:viajes/presentation/widgets/texts/brand_tittle.dart';
import 'package:viajes/presentation/widgets/texts/section_heading.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';

class TouristPlaceClientView extends ConsumerStatefulWidget {
  const TouristPlaceClientView({super.key});

  @override
  TouristPlaceClientViewState createState() => TouristPlaceClientViewState();
}

class TouristPlaceClientViewState
    extends ConsumerState<TouristPlaceClientView> {
  @override
  void initState() {
    super.initState();
    ref.read(getAllCategoryProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(getAllCategoryProvider);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        title: Text(
          'Lugares Turisticos',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          TCartCounterIcon(iconColor: TColors.black, onPressed: () {}),
        ],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.dark
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      ///* SearchBar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: 'Encuentra lugares turisticos',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      ///* Categories brand
                      TSectionHeadings(
                        title: 'Categorias disponibles',
                        onPressed: () {},
                        showActionButton: true,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      TGridviewLayout(
                          itemCount: categories.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final category = categories[index];
                            String image = categoryImages[category.name] ??
                                TImages.ecotoristIcon;
                            return GestureDetector(
                              onTap: () {},
                              child: TRoundedContainer(
                                padding:
                                    const EdgeInsets.all(TSizes.defaultSpace),
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
                                    const SizedBox(
                                        height: TSizes.spaceBtwItems / 2),

                                    //* text
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BrandTitleWithVerifiedIcon(
                                            title: category.name,
                                            brandTextSize: TextSizes.large,
                                          ),
                                          Text(
                                            category.description,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              )
            ];
          },
          body: Container()),
    );
  }
}
