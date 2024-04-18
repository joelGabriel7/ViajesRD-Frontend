import 'package:flutter/material.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/widgets/client/Banner/t_rounded_banner.dart';
import 'package:viajes/presentation/widgets/client/curved%20edges/curved_edges_widget.dart';

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
        TCurvedEdgeWidget(
          child: SizedBox(
            width: double.infinity,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: AspectRatio(
                aspectRatio: 1,
                child: TRoundedBanner(
                  isNetworkImage: true,
                  imageUrl: widget.places.images.isNotEmpty
                      ? widget.base +
                          widget.places.images[selectedImage].imageUrl
                      : 'https://th.bing.com/th/id/OIP.NtlX1xnmpCVssKBag3XPNAHaFj?rs=1&pid=ImgDetMain',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 0,
          left: 0,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(widget.places.images.length,
                      (index) => buildSmallPreview(index, widget.base))
                ],
              ),
            ),
          ),
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
        child: TRoundedBanner(
          isNetworkImage: true,
          imageUrl: base + widget.places.images[index].imageUrl,
          height: 48,
          width: 48,
          fit: BoxFit.cover,
          applyImageRadius: true,
          borderRadius:
              12, // Para que coincida con el borderRadius del Container
        ),
      ),
    );
  }
}
