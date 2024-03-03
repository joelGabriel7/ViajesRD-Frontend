import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/infrastructure/models/tourist_places_models.dart' as tp;
import 'package:viajes/presentation/provider/categories/categories_provider.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_places_provider.dart';

const _backgroundColor = Color(0xFFF6F7FA);
const heightCategory = 50.0;
const heightProduct = 120.0;

class TouristPlacesView extends ConsumerStatefulWidget {
  const TouristPlacesView({super.key});

  @override
  TouristPlacesViewState createState() => TouristPlacesViewState();
}

class TouristPlacesViewState extends ConsumerState<TouristPlacesView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 0, vsync: this);
    ref.read(getAllCategoryProvider.notifier).loadNextPage();
    ref.read(getTouristPlacesProvider.notifier).loadTouristPlaces();
  }

  @override
  void dispose() {
    _tabController.dispose();
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

      categoryPlaces.addAll(placesInCategory
          .map((place) => TouristPlacesItems(touristPlaces: place))
          .toList());
    }

    if (_tabController.length != categories.length) {
      _tabController.dispose();
      _tabController = TabController(length: categories.length, vsync: this);
    }

    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        title: const Text('Zonas turisticas'),
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _tabController,
          builder: (_, __) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: _backgroundColor,
                height: 50,
                child: TabBar(
                  onTap: (value) {
                    ref
                        .watch(getAllCategoryProvider.notifier)
                        .setSelectCategory(value);
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
                  child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: categoryPlaces,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  final String category;
  final int index;
  final TabController tabController; // Añadir esto

  const TabBarWidget({
    super.key,
    required this.category,
    required this.index,
    required this.tabController, // Añadir esto
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = tabController.index == index;
    return Opacity(
      opacity: isSelected ? 1 : 0.5,
      child: Card(
        elevation: isSelected ? 1 : 0,
        // color: _backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            category,
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      color: Colors.white,
      height: heightCategory,
      alignment: Alignment.centerLeft,
      child: Text(
        category,
        style: const TextStyle(
            color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TouristPlacesItems extends StatelessWidget {
  final TouristPlaces touristPlaces;
  const TouristPlacesItems({super.key, required this.touristPlaces});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightProduct,
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            // Image.network('https://api-viajesrd.onrender.com/${touristPlaces.images[0].imageUrl}')
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/images/OIP.jpeg',
                scale: 7.0,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(touristPlaces.name,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(touristPlaces.description,
                      maxLines: 3,
                      style: const TextStyle(
                        color: Color.fromARGB(207, 7, 149, 225),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(touristPlaces.location,
                      style: const TextStyle(
                        color: Color.fromRGBO(115, 199, 118, 1),
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// 



