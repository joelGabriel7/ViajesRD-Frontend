import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () => context.push('/home/client/0/cart/item'),
            icon: Icon(
              Icons.event_note_rounded,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: TColors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  '2',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.white, fontSizeFactor: 0.8),
                ),
              )),
        )
      ],
    );
  }
}
