import 'package:flutter/material.dart';

class CustomFieldForm extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomFieldForm({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: labelText,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
