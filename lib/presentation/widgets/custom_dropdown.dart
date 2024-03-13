import 'package:flutter/material.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/domain/entity/category.dart';

class CustomDropdownFormField extends StatefulWidget {
  final List<Category> categories;
  final void Function(String?) onSelected;
  final String? initialValue;

  const CustomDropdownFormField(
      {super.key,
      required this.categories,
      required this.onSelected,
      this.initialValue});

  @override
  State<CustomDropdownFormField> createState() =>
      _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialValue;
  }

  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Categoría',
        prefixIcon: const Icon(Icons.category),
        suffixIcon: selectedCategory != null
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    selectedCategory = null;
                  });
                },
              )
            : null,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCategory,
          isDense: true, // Reduce el espacio vertical del dropdown
          isExpanded:
              true, // Hace que el dropdown ocupe el ancho del InputDecorator
          hint: const Text(TTexts.touristPlaceCategoria),
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue;
            });
            widget.onSelected(newValue);
          },
          items: widget.categories
              .map<DropdownMenuItem<String>>((Category category) {
            return DropdownMenuItem<String>(
              value: category.id.toString(),
              child: Text(category.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
