import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_controller/home_controller.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        ListPage.values.length,
        (index) => _ButtonHeader(
          index: index,
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
    return Expanded(
      child: InkWell(
        onTap: () => controller.setScreen(index),
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          decoration: BoxDecoration(
            border: Border.all(
              width: .2,
              color: Colors.black.withOpacity(select ? 0 : 1),
            ),
            color: Colors.black.withOpacity(select ? 0.2 : 0),
          ),
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          child: Center(
            child: Text(ListPage.values[index].name),
          ),
        ),
      ),
    );
  }
}
