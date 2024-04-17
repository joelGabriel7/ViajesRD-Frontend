import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/image_strings.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/config/helpers/maps_categories.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/provider/categories/categories_provider.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_places_provider.dart';
import 'package:viajes/presentation/widgets/client/appBar/appbar.dart';
import 'package:viajes/presentation/widgets/client/appBar/tabbar.dart';
import 'package:viajes/presentation/widgets/client/containers/search_container.dart';
import 'package:viajes/presentation/widgets/client/products/cart_menu_item.dart';
import 'package:viajes/presentation/widgets/client/products/t_product_card_vertical.dart';
import 'package:viajes/presentation/widgets/shared/gridview_layout.dart';
import 'package:viajes/presentation/widgets/texts/section_heading.dart';
import 'package:viajes/presentation/widgets/texts/tbrand_card.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';

class TouristPlaceClientView extends ConsumerStatefulWidget {
  const TouristPlaceClientView({super.key});

  @override
  TouristPlaceClientViewState createState() => TouristPlaceClientViewState();
}

class TouristPlaceClientViewState extends ConsumerState<TouristPlaceClientView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await ref.read(getAllCategoryProvider.notifier).loadNextPage();
    await ref.read(getTouristPlacesProvider.notifier).loadTouristPlaces();
    if (mounted) {
      _tabController = TabController(
          vsync: this, length: ref.read(getAllCategoryProvider).length);
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(getAllCategoryProvider);
    final touristPlaces = ref.watch(getTouristPlacesProvider);

    if (categories.isEmpty || _tabController == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
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
                              return TBrandCard(
                                  image: image, category: category);
                            })
                      ],
                    ),
                  ),
                  //Tabs
                  bottom: TTabBar(
                      categories: categories, tabController: _tabController),
                )
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                List<TouristPlaces> filteredPlaces = touristPlaces
                    .where((place) => place.categoryId == category.id)
                    .toList();
                return TGridviewLayout(
                    itemCount: filteredPlaces.length,
                    itemBuilder: (_, index) {
                      return TProductCardVertical(
                        place: filteredPlaces[index],
                      );
                    });
              }).toList(),
            )),
      ),
    );
  }
}
