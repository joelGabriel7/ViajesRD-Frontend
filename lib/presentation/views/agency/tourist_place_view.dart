import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/provider/categories/categories_provider.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_places_provider.dart';

import '../../widgets/items_tabBar_listview.dart';
import '../../widgets/tabBar_widget.dart';

const _backgroundColor = Color(0xFFF6F7FA);

class TouristPlacesView extends ConsumerStatefulWidget {
  const TouristPlacesView({super.key});

  @override
  TouristPlacesViewState createState() => TouristPlacesViewState();
}

class TouristPlacesViewState extends ConsumerState<TouristPlacesView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController scrollController;
  bool isTabSelected = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
    _tabController = TabController(length: 0, vsync: this);
    ref.read(getAllCategoryProvider.notifier).loadNextPage();
    ref.read(getTouristPlacesProvider.notifier).loadTouristPlaces();
  }

  void _onScroll() {
    final touristPlacesProvider = ref.watch(getTouristPlacesProvider);
    final categories = ref.watch(getAllCategoryProvider);

    if (isTabSelected) return;

    double currentOffset = scrollController.offset;
    double cumulativeHeight = 0.0;
    int newTabIndex = 0;

    for (int i = 0; i < categories.length; i++) {
      final placesCount = touristPlacesProvider
          .where((place) => place.categoryId == categories[i].id)
          .length;
      double sectionHeight = heightCategory + (placesCount * heightProduct);

      if (cumulativeHeight + sectionHeight > currentOffset) {
        newTabIndex = i;
        break;
      }
      cumulativeHeight += sectionHeight;
    }

    if (_tabController.index != newTabIndex) {
      _tabController.animateTo(newTabIndex);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    scrollController.dispose();
    scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final touristPlacesProvider = ref.watch(getTouristPlacesProvider);
    final categories = ref.watch(getAllCategoryProvider);

    List<Widget> categoryPlaces = [];

    for (final category in categories) {
      categoryPlaces.add(CategoryItem(category: category.name));

      List<TouristPlaces> placesInCategory = touristPlacesProvider
          .where((places) => places.categoryId == category.id)
          .toList();

      categoryPlaces.addAll(placesInCategory.map((place) {
        return Slidable(
            startActionPane:
                ActionPane(motion: const StretchMotion(), children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: const Color(0xFF21CA70),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Editar',
              ),
            ]),
            endActionPane: ActionPane(motion: const StretchMotion(), children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Eliminar',
              ),
            ]),
            child: TouristPlacesItems(touristPlaces: place));
      }).toList());
    }

    void scrollToCategory(int categoryIndex) {
      isTabSelected = true;
      if (categoryIndex < 0 || categoryIndex >= categories.length) {
        isTabSelected = false;
        return;
      }

      // Estimación inicial del desplazamiento.
      double offset = 0.0;
      for (int i = 0; i < categoryIndex; i++) {
        offset += heightCategory;
        final placesCount = touristPlacesProvider
            .where((place) => place.categoryId == categories[i].id)
            .length;
        offset += placesCount * heightProduct;
      }

      // Desplázate a la posición calculada.

      scrollController
          .animateTo(
            offset,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          )
          .then((_) => Future.delayed(const Duration(milliseconds: 100), () {
                isTabSelected = false;
              }));
    }

    if (_tabController.length != categories.length) {
      _tabController.dispose();
      _tabController = TabController(length: categories.length, vsync: this);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Zonas turisticas'),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _tabController,
          builder: (_, __) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                height: 60,
                child: TabBar(
                  onTap: (value) {
                    ref
                        .watch(getAllCategoryProvider.notifier)
                        .setSelectCategory(value);
                    scrollToCategory(value);
                  },
                  controller: _tabController,
                  tabs: List.generate(
                      categories.length,
                      (index) => TabBarWidget(
                          category: categories[index].name,
                          index: index,
                          tabController: _tabController)),
                  isScrollable: true,
                  indicatorWeight: 0.1,
                  indicatorColor: _backgroundColor,
                ),
              ),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: ref
                    .read(getTouristPlacesProvider.notifier)
                    .loadTouristPlaces,
                child: ListView.builder(
                  itemCount: categoryPlaces.length,
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    return categoryPlaces[index];
                  },
                ),
              ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: _backgroundColor,
        child: const Icon(
          Icons.add,
          color: Colors.blue,
        ),
        // backgroundColor: Colors.blue,
      ),
    );
  }
}




// 



