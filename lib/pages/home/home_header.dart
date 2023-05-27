import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/header_menu/header_menu.dart';
import 'home_controller/home_controller.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        ListPage.values.length,
        (index) => _ButtonHeader(
          index: index
        ),
      ),
    );
  }
}


class _ButtonHeader extends StatelessWidget {
  final int index;
  const _ButtonHeader({required this.index});
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<HomeController>();
    bool select = controller.currentIndexPage != index;
    return HeaderMenu(
      select: select,
      fun: () => controller.setScreen(index),
          child: Center(
        child: Text(
          ListPage.values[index].name,
          style: TextStyle(
            color: Colors.black.withOpacity(select ? 0.6 : 1),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
