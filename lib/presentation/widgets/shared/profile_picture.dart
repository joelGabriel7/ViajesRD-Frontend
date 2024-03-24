import 'package:flutter/material.dart';
import 'package:viajes/config/constants/image_strings.dart';
import 'package:viajes/presentation/widgets/shared/t_circular_images.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const TCircularImages(
            fit: BoxFit.cover,
            image: TImages.user,
            isNetworkImage: false,
            width: 80,
            height: 80,
          ),
          TextButton(
              onPressed: () {}, child: const Text('Change Profile Picture'))
        ],
      ),
    );
  }
}
