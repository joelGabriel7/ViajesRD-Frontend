import 'package:flutter/material.dart';
import 'package:viajes/presentation/widgets/shared/images_text_widget.dart';

class THomeCategory extends StatefulWidget {
  const THomeCategory({
    super.key,
    required this.item,
  });

  final List item;

  @override
  State<THomeCategory> createState() => _THomeCategoryState();
}

class _THomeCategoryState extends State<THomeCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.item.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImagenText(
            categoryName: widget.item[index].name,
            text: widget.item[index].name,
            onTap: () {},
          );
        },
      ),
    );
  }
}
