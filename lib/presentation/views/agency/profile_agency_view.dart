import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/presentation/widgets/shared/profile_menu.dart';
import 'package:viajes/presentation/widgets/shared/profile_picture.dart';
import 'package:viajes/presentation/widgets/shared/sections_headings.dart';
import 'package:viajes/presentation/widgets/shared/t_app_bar.dart';

class ProfileAgencyView extends StatelessWidget {
  const ProfileAgencyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TAppBar(
          title: Text('Profile'),
          snowBackArrow: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //* Profile Picture
                const ProfilePicture(),

                //*Details

                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSectionsHeadings(
                  title: 'Profile information',
                  snowActionArrow: true,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                ProfileMenu(
                  title: 'Name',
                  value: 'Aventuras RD',
                  onButtonPressed: () {},
                ),
                ProfileMenu(
                  title: 'Username',
                  value: 'aventurasrd03',
                  onButtonPressed: () {},
                ),

                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
                //* Heading Agenct Info
                TSectionsHeadings(
                  title: 'Agency information',
                  snowActionArrow: true,
                  onButtonPressed: () => context.push('/agency/new'),
                ),

                ProfileMenu(
                  title: 'Name',
                  value: 'Aventuras RD',
                  onButtonPressed: () {},
                ),
                ProfileMenu(
                  title: 'Numero telf.',
                  value: '849-654-8531',
                  onButtonPressed: () {},
                  icon: Iconsax.copy,
                ),
                ProfileMenu(
                  title: 'Address',
                  value: 'Santiago, Rep. Dom.',
                  onButtonPressed: () {},
                ),
                ProfileMenu(
                  title: 'Email',
                  value: 'user@example.com',
                  onButtonPressed: () {},
                ),
                ProfileMenu(
                  title: 'RNC',
                  value: '003-2021-0001',
                  onButtonPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
