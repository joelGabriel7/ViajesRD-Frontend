import 'package:flutter/material.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/presentation/widgets/client/containers/primary_header_container.dart';
import 'package:viajes/presentation/widgets/client/containers/search_container.dart';
import 'package:viajes/presentation/widgets/client/thome_category.dart';
import 'package:viajes/presentation/widgets/shared/thomes_appbar.dart';
import 'package:viajes/utils/constants/sizes.dart';

import '../../widgets/texts/section_heading.dart';

class HomeViewClient extends StatelessWidget {
  const HomeViewClient({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(children: [
              //* AppBar
              SizedBox(
                height: 8,
              ),
              ThomeAppBar(),
              SizedBox(height: TSizes.spaceBtwSections / 2),
              //*  SearchBar
              TSearchContainer(
                text: 'Encuentra lugares turisticos',
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              //* Categories
              Padding(
                padding: EdgeInsets.only(left: TSizes.defaultSpace),
                child: Column(
                  children: [
                    //* Heading

                    TSectionHeadings(
                      title: 'Categorias populares',
                      showActionButton: false,
                      textColor: TColors.white,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //* Categories
                    THomeCategory()
                  ],
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
