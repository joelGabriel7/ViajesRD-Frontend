import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText(
      {super.key,
      this.currencySing = '\$',
      required this.price,
      required this.maxlines,
      this.isLarge = false,
      this.lineThrough = false});

  final String currencySing, price;
  final int maxlines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySing + price,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
