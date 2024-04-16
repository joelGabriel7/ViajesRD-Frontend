import 'package:flutter/material.dart';
import 'package:viajes/presentation/widgets/client/containers/primary_header_container.dart';

class HomeViewClient extends StatelessWidget {
  const HomeViewClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [TPrimaryHeaderContainer(child: Container())],
        ),
      ),
    );
  }
}
