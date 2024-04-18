// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/helpers/auth/storage_token.dart';
import 'package:viajes/config/menu/menu_item.dart';
import 'package:viajes/presentation/widgets/side_menu.dart';

// import '../../shared/bottom_navigations.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
    required this.height,
    required this.widht,
    required this.titles,
  });

  final height;
  final widht;
  final List<MenuItem> titles;

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? TColors.dark : colorScheme.primary;
    final textColor = isDarkMode ? TColors.textWhite : TColors.textWhite;
    final iconColor = isDarkMode ? TColors.black : colorScheme.primary;
    final scaffolKey = GlobalKey<ScaffoldState>();
    final date = DateTime.now();
    final format = DateFormat('jm').format(date);
    final lastFourTitles = widget.titles.length >= 4
        ? widget.titles.sublist(widget.titles.length - 4)
        : widget.titles;
    return Scaffold(
      key: scaffolKey,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                final SecureStorage secureStorage = SecureStorage();
                await secureStorage.deleteToken();
                // ignore: use_build_context_synchronously
                context.go('/login');
              },
              icon: const Icon(Icons.logout_outlined))
        ],
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: SideMenu(scaffolKey: scaffolKey),
      body: Container(
        color: backgroundColor,
        height: widget.height,
        width: widget.widht,
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(),
                height: widget.height * 0.18,
                width: widget.widht,
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 20, right: 20),
                    child: Column(
                      children: [
                        Text(
                          'Nombre de Agencia',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Ultima actualizacion: $format',
                          style: TextStyle(
                              color: textColor, fontSize: 15, letterSpacing: 1),
                        ),
                      ],
                    ),
                  )
                ])),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: TColors.light,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: widget.height,
                width: widget.widht,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.1,
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: lastFourTitles.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.push(lastFourTitles[index].link);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 15),
                        decoration: BoxDecoration(
                            color: TColors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 1,
                                  blurRadius: 6)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              lastFourTitles[index].icon,
                              size: 50,
                              color: iconColor,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                                child: Text(
                              lastFourTitles[index].title,
                              style: TextStyle(color: iconColor),
                            )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
