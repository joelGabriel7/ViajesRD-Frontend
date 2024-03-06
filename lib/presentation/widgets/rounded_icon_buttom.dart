import 'package:flutter/material.dart';

class RoundendIconBtn extends StatelessWidget {
  const RoundendIconBtn({
    super.key,
    required this.iconData,
    required this.press,
  });

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size * 0.2;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.1,
      width: size.width * 0.7,
      child: TextButton(
        onPressed: press,
        style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.zero),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(70)))),
        child: Icon(iconData),
      ),
    );
  }
}
