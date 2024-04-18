import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/image_strings.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/provider/categories/categories_provider.dart';
import 'package:viajes/presentation/provider/search/search_movies_provider.dart';
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

  void handleQuery(String query) {
    ref.read(searchQueryProvider.notifier).state = query.trim();

    if (query.isNotEmpty) {
      ref.read(searchPlacesProviders.notifier).searchPlaceByQuery(query);
    } else {
      ref.read(getTouristPlacesProvider.notifier).loadTouristPlaces();
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(getAllCategoryProvider);
    final currentSearchQuery = ref.watch(searchQueryProvider);
    final places = currentSearchQuery.isNotEmpty
        ? ref.watch(searchPlacesProviders)
        : ref.watch(getTouristPlacesProvider);

    final search = currentSearchQuery.isNotEmpty;

    if (categories.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    List<TouristPlaces> displayTouristPlaces =
        places.length > 6 ? places.sublist(0, 6) : places;

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
              TSearchContainer(onSearch: handleQuery),
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
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
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
                  if (!search) ...[
                    const TBannerSlider(
                      banners: [
                        TImages.banner1,
                        TImages.banner2,
                        TImages.banner3,
                        TImages.banner4
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TGridviewLayout(
                    itemCount: displayTouristPlaces.length,
                    itemBuilder: (context, index) {
                      final place = places[index];
                      return TProductCardVertical(
                        place: place,
                      );
                    },
                  ),
                  if (places.isEmpty)
                    Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: Text("No se encontró lugar turístico",
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
