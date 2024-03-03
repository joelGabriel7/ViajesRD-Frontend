import 'package:flutter/material.dart';
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
        margin: const EdgeInsets.symmetric(vertical: 2),
        elevation: 0,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            // Image.network('https://api-viajesrd.onrender.com/${touristPlaces.images[0].imageUrl}')
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: touristPlaces.images.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://api-viajesrd.onrender.com/${touristPlaces.images[0].imageUrl}',
                        width: 100,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      'assets/images/OIP.jpeg', // Proporciona una imagen predeterminada si no hay imágenes
                      scale: 7.0,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              width: 5,
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
