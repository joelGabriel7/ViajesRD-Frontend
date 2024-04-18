import 'package:flutter/material.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/presentation/widgets/client/Banner/t_rounded_banner.dart';
import 'package:viajes/presentation/widgets/client/curved%20edges/curved_edges_widget.dart';

class ExcursionImages extends StatefulWidget {
  const ExcursionImages({
    super.key,
    required this.base,
    required this.excursion,
  });

  final String base;
  final Excursion excursion;

  @override
  State<ExcursionImages> createState() => _ExcursionImagesState();
}

class _ExcursionImagesState extends State<ExcursionImages> {
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
                  imageUrl: widget.excursion.touristPlaces.images.isNotEmpty
                      ? '${widget.base}${widget.excursion.touristPlaces.images[selectedImage].imageUrl}'
                      : 'https://via.placeholder.com/400', // URL de imagen de respaldo
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.excursion.touristPlaces.images.length,
                (index) => buildSmallPreview(index),
              ),
            ),
          ),
        )
      ],
    );
  }

  GestureDetector buildSmallPreview(int index) {
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
            color: selectedImage == index ? Colors.blue : Colors.transparent,
          ),
        ),
        child: TRoundedBanner(
          isNetworkImage: true,
          imageUrl:
              '${widget.base}${widget.excursion.touristPlaces.images[index].imageUrl}',
          height: 48,
          width: 48,
          fit: BoxFit.cover,
          applyImageRadius: true,
          borderRadius: 12,
        ),
      ),
    );
  }
}
