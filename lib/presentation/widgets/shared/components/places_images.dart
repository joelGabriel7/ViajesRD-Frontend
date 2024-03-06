import 'package:flutter/material.dart';
import 'package:viajes/domain/entity/tourist_places.dart';

class PlaceImages extends StatefulWidget {
  const PlaceImages({
    super.key,
    required this.base,
    required this.places,
  });

  final String base;
  final TouristPlaces places;

  @override
  State<PlaceImages> createState() => _PlaceImagesState();
}

class _PlaceImagesState extends State<PlaceImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 500,
          height: 275,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              widget.base + widget.places.images[selectedImage].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.places.images.length,
                (index) => buildSmallPreview(index, widget.base))
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallPreview(int index, base) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(
                color:
                    selectedImage == index ? Colors.blue : Colors.transparent)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(base + widget.places.images[index].imageUrl,
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
