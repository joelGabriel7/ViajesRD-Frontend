import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Widget? child;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56, // Set the height
      width: double.infinity,
      child: ElevatedButton(
        onPressed: press,
        child: child ??
            Text(
              text,
              style: const TextStyle(
                fontSize: 18, // Font size
                fontWeight: FontWeight.bold, // Font weight
              ),
            ),
      ),
    );
  }
}
