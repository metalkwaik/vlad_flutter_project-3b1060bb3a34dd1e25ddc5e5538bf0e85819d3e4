import 'package:flutter/material.dart';

import 'home_body.dart';
import 'home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          HomeHeader(),
          SizedBox(height: 18),
          HomeBody(),
        ],
      ),
    );
  }
}
