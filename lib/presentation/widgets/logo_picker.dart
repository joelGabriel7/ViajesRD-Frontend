// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LogoPicker extends StatefulWidget {
  final Function(XFile?) onImagePicked;
  const LogoPicker({super.key, required this.onImagePicked});

  @override
  LogoPickerState createState() => LogoPickerState();
}

class LogoPickerState extends State<LogoPicker> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _controller.text = image.name;
      });
      widget.onImagePicked(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Toca para seleccionar un logo',
        suffixIcon: IconButton(
          icon: const Icon(Icons.image_search),
          onPressed: _pickImage,
        ),
        // A continuación, usa los estilos de borde que has definido en tu tema
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
        // Puedes ajustar los demás estilos según necesites
      ),
      onTap:
          _pickImage, // Permite seleccionar la imagen cuando se toca el campo
    );
  }
}
