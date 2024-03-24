import 'package:flutter/material.dart';

class TSectionsHeadings extends StatelessWidget {
  const TSectionsHeadings(
      {super.key,
      this.textColor,
      this.snowActionArrow = true,
      required this.title,
      this.buttonTitle = 'View all',
      this.onButtonPressed});

  final Color? textColor;
  final bool snowActionArrow;
  final String title, buttonTitle;
  final void Function()? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (snowActionArrow)
          TextButton(onPressed: onButtonPressed, child: Text(buttonTitle))
      ],
    );
  }
}
