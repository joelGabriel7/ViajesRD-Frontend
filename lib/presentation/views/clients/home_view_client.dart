import 'package:flutter/material.dart';
import 'package:viajes/presentation/widgets/client/containers/primary_header_container.dart';
import 'package:viajes/presentation/widgets/shared/thomes_appbar.dart';

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
              ThomeAppBar()
              //*  SearchBar

              //* Categories
            ]))
          ],
        ),
      ),
    );
  }
}
