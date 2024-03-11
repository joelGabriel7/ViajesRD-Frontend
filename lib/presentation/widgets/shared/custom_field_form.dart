import 'package:flutter/material.dart';

class CustomFieldForm extends StatelessWidget {
  const CustomFieldForm({
    super.key,
    required this.textController,
    required this.labelText,
    required this.icons,
  });

  final TextEditingController textController;
  final String labelText;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      expands: false,
      decoration:
          InputDecoration(labelText: labelText, prefixIcon: Icon(icons)),
    );
  }
}
