import 'package:flutter/material.dart';
import 'package:viajes/config/constants/image_strings.dart';
import 'package:viajes/presentation/widgets/shared/images_text_widget.dart';

class THomeCategory extends StatelessWidget {
  const THomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImagenText(
            image: TImages.beachIcon,
            text: 'Playas',
            onTap: () {},
          );
        },
      ),
    );
  }
}
