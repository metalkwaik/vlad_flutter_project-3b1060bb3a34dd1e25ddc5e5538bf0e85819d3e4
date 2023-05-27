import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/menu/menu_header.dart';

import 'menu_body.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MenuHeader(),
        MenuBody(),
      ],
    );
  }
}
