import 'package:flutter/material.dart';
import 'package:flutter_application_1/page_factory/page_factory.dart';
import 'package:flutter_application_1/pages/stac_page/stac_page_controller.dart/pages_controller.dart';
import 'package:provider/provider.dart';

import '../auth/controller/auth_controller.dart';

class StacPages extends StatelessWidget {
  const StacPages({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PagesController>();
    final factor = FactoryPage();
    return Scaffold(
      bottomNavigationBar: const _Buttom(),
      body: IndexedStack(
          index: controller.currentIndexPage,
          children: [
            factor.makeHome(),
            factor.makeMenu(),
            factor.makeCart(),
            factor.makeProfile(),

          ],

      ),
    );
  }
}

class _Buttom extends StatelessWidget {
  const _Buttom();
  final List textMenu = const [
    'Home',
    'menu',
    'Сart',
    'Profile',
  ];
  final List iconMenu = const [
    Icons.home,
    Icons.menu,
    Icons.add,
    Icons.account_box
  ];
  final List colorMenu = const [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    final buttom = context.watch<PagesController>();
    return BottomNavigationBar(
      elevation: 10,
      onTap: (value) => buttom.setScreen(value),
      selectedItemColor: Colors.black87,
      unselectedItemColor: Colors.black45,
      currentIndex: buttom.currentIndexPage,
      items: List.generate(
        textMenu.length,
        (index) => BottomNavigationBarItem(
          icon: Icon(iconMenu[index]),
          label: textMenu[index],
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
