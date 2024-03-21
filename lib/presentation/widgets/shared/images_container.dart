import 'dart:io';

import 'package:flutter/material.dart';
import 'package:viajes/config/constants/colors.dart';

class ImagesContainer extends StatelessWidget {
  final VoidCallback press;
  final List<File> images;
  final Function(int) onRemove;

  const ImagesContainer(
      {super.key,
      required this.press,
      required this.images,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: TColors.white,
        elevation: 0,
        child: InkWell(
          onTap: () {
            // Acción al tocar el card
            press();
          },
          child: images.isEmpty ? _buildMessages() : _buildImages(),
        ),
      ),
    );
  }

  GridView _buildImages() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Ajusta según tu necesidad
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onRemove(index),
            child: Image.file(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        });
  }

  Container _buildMessages() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.upload, // El icono que prefieras
            size: 48.0, // El tamaño que prefieras
          ),
          Text(
            'Pulse para elegir imágenes',
            style: TextStyle(
              fontSize: 16.0, // El tamaño que prefieras
            ),
          ),
          Text(
            'Tamaño máximo por imagen: 2 MB',
            style: TextStyle(
              fontSize: 14.0, // El tamaño que prefieras
            ),
          ),
        ],
      ),
    );
  }
}
