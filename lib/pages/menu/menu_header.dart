import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu_controller/menu_controller.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          CategoryPage.values.length,
          (index) => _ItemBuild(index: index),
        ),
      ),
    );
  }
}

class _ItemBuild extends StatelessWidget {
  final int index;
  const _ItemBuild({required this.index});
  @override
  Widget build(BuildContext context) {
    List icon = <IconData>[Icons.bakery_dining, Icons.wine_bar];
    final controller = context.watch<MenuControll>();
    final title = CategoryPage.values[index].name.toString();
    bool select = title == controller.categoryPageName.name;
    return InkWell(
      onTap: () => controller.setScreen(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade500
          ),
          color: Colors.grey.withOpacity(!select ? 0.2 : 0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        child: Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
if (select && index <= icon.length - 1)
              Row(children: [
                Icon(icon[index], size: 18),
                const SizedBox(width: 9)
              ]),
            Text(
              title,
              style: TextStyle(
                color: Colors.black.withOpacity(!select ? 0.6 : 1),
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
