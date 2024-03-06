import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.customAppBar,
  });
  final Widget customAppBar;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customAppBar,
          Container(
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const Text(
                  '4.5',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
