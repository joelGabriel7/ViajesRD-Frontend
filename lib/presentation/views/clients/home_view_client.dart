import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/image_strings.dart';
import 'package:viajes/presentation/provider/categories/categories_provider.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_places_provider.dart';
import 'package:viajes/presentation/widgets/client/Banner/banner_slider.dart';
import 'package:viajes/presentation/widgets/client/containers/primary_header_container.dart';
import 'package:viajes/presentation/widgets/client/containers/search_container.dart';
import 'package:viajes/presentation/widgets/client/products/t_product_card_vertical.dart';
import 'package:viajes/presentation/widgets/client/thome_category.dart';
import 'package:viajes/presentation/widgets/shared/gridview_layout.dart';
import 'package:viajes/presentation/widgets/shared/thomes_appbar.dart';
import 'package:viajes/utils/constants/sizes.dart';
import '../../widgets/texts/section_heading.dart';

class HomeViewClient extends ConsumerStatefulWidget {
  const HomeViewClient({super.key});

  @override
  HomeViewClientState createState() => HomeViewClientState();
}

class HomeViewClientState extends ConsumerState<HomeViewClient> {
  @override
  void initState() {
    super.initState();
    ref.read(getAllCategoryProvider.notifier).loadNextPage();
    ref.read(getTouristPlacesProvider.notifier).loadTouristPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(getAllCategoryProvider);
    final touristPlaces = ref.watch(getTouristPlacesProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(children: [
              //* AppBar
              const SizedBox(
                height: 8,
              ),
              const ThomeAppBar(),
              const SizedBox(height: TSizes.spaceBtwSections / 2),
              //*  SearchBar
              const TSearchContainer(
                text: 'Encuentra lugares turisticos',
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              //* Categories
              Padding(
                padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                child: Column(
                  children: [
                    //* Heading
                    const TSectionHeadings(
                      title: 'Categorias populares',
                      showActionButton: false,
                      textColor: TColors.white,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    //* Categories
                    THomeCategory(
                      item: categories,
                    )
                  ],
                ),
              ),
            ])),
            //*Body */
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TBannerSlider(
                    banners: [
                      TImages.banner1,
                      TImages.banner2,
                      TImages.banner3,
                      TImages.banner4
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TGridviewLayout(
                    itemCount: touristPlaces.length,
                    itemBuilder: (context, index) {
                      final place = touristPlaces[index];
                      if (touristPlaces.isNotEmpty) {
                        return TProductCardVertical(
                          place: place,
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
