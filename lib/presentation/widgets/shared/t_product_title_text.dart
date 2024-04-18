import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText(
      {super.key,
      required this.title,
      this.smallSize = false,
      this.maxlines = 2,
      this.textAlign = TextAlign.left,
      this.overflow = TextOverflow.ellipsis});

  final String title;
  final bool smallSize;
  final int maxlines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: overflow,
      maxLines: 2,
      textAlign: TextAlign.left,
    );
  }
}
