import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/sizes.dart';
import 'package:viajes/presentation/widgets/shared/profile_menu.dart';
import 'package:viajes/presentation/widgets/shared/profile_picture.dart';
import 'package:viajes/presentation/widgets/shared/sections_headings.dart';
import 'package:viajes/presentation/widgets/shared/t_app_bar.dart';

class ProfileAgencyView extends ConsumerStatefulWidget {
  const ProfileAgencyView({
    super.key,
  });

  @override
  ProfileAgencyViewState createState() => ProfileAgencyViewState();
}

class ProfileAgencyViewState extends ConsumerState<ProfileAgencyView> {
  @override
  void initState() {
    super.initState();
  }

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
                  value: '809-555-5555',
                  onButtonPressed: () {},
                  icon: Iconsax.copy,
                ),
                ProfileMenu(
                  title: 'Address',
                  value: 'Calle 1, No. 1, Santiago',
                  onButtonPressed: () {},
                ),
                ProfileMenu(
                  title: 'Email',
                  value: 'agency@agencyemail.com',
                  onButtonPressed: () {},
                ),
                ProfileMenu(
                  title: 'RNC.',
                  value: '123456789',
                  onButtonPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
