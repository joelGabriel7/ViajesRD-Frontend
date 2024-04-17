import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/presentation/provider/excursions/excursions_provider.dart';
import 'package:viajes/presentation/widgets/client/appBar/appbar.dart';
import 'package:viajes/presentation/widgets/client/excursions/t_excursion_card.dart';
import 'package:viajes/presentation/widgets/client/products/cart_menu_item.dart';
import 'package:viajes/presentation/widgets/shared/gridview_layout.dart';

class ExcursionViewClient extends ConsumerStatefulWidget {
  const ExcursionViewClient({super.key});

  @override
  ExcursionViewClientState createState() => ExcursionViewClientState();
}

class ExcursionViewClientState extends ConsumerState<ExcursionViewClient> {
  @override
  void initState() {
    super.initState();
    ref.read(excursionsProvider.notifier).loadMoreExcursion();
  }

  @override
  Widget build(BuildContext context) {
    final excursion = ref.watch(excursionsProvider);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        title: Text(
          'Excursiones disponibles',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [TCartCounterIcon(iconColor: TColors.black, onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 20),
        physics: const BouncingScrollPhysics(),
        child: TGridviewLayout(
            itemCount: excursion.isNotEmpty ? excursion.length : 1,
            itemBuilder: (_, index) =>
                TExcursionCardVertical(excursion: excursion[index])),
      ),
    );
  }
}
