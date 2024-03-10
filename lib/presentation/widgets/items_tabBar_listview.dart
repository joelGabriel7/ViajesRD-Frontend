import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/domain/entity/tourist_places.dart';

const heightCategory = 50.0;
const heightProduct = 150.0;

class CategoryItem extends StatelessWidget {
  final String category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? TColors.dark : TColors.white;
    return Container(
      color: backgroundColor,
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
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? TColors.dark : TColors.white;

    return SizedBox(
      height: heightProduct,
      child: Card(
        color: backgroundColor,
        margin: const EdgeInsets.symmetric(vertical: 2),
        elevation: 0,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            //* Images
            touristPlaces.images.isNotEmpty
                ? SizedBox(
                    width: size.width * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          'https://apiviajesrd.info/${touristPlaces.images[0].imageUrl}',
                          height: 350,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: backgroundColor,
                            )),
                          );
                        }

                        return GestureDetector(
                            onTap: () => context
                                .push('/touristplaces/${touristPlaces.id}'),
                            child: FadeIn(child: child));
                      }),
                    ),
                  )
                : SizedBox(
                    width: size.width * 0.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/OIP.jpeg', // Proporciona una imagen predeterminada si no hay imágenes
                        scale: 7.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            const SizedBox(
              width: 10,
            ),

            //* Data
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
