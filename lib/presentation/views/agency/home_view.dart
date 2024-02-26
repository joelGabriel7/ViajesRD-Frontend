import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/bottom_navigations.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.height,
    required this.widht,
    required this.titles,
  });

  final height;
  final widht;
  final List titles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigations(),
      body: Container(
        color: Colors.indigo,
        height: height,
        width: widht,
        child: Column(
          children: [
            Container(
                decoration: const BoxDecoration(),
                height: height * 0.25,
                width: widht,
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 45, left: 20, right: 20),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            // image: const DecorationImage(
                            //     image: AssetImage(
                            //   'images/woman.png',
                            // ))
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                    child: Column(
                      children: [
                        Text(
                          'Agency Name',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Last Update: 24 feb 2024',
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: 15,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  )
                ])),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(50),
                ),
              ),
              height: 539,
              width: widht,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.1,
                  crossAxisCount: 2,
                  mainAxisSpacing: 25,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      final routesMap = {
                        'Excursions': '/excursions',
                        'Reservations': '/reservations',
                        'Clients': '/clients',
                        'Tourist places': '/touristplaces',
                      };

                      final route = routesMap[titles[index]];
                      if (route != null) {
                        context.push(route);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                          Center(child: Text(titles[index])),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
