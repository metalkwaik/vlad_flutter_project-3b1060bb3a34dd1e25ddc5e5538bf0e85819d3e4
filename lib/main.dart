
import 'package:flutter/material.dart';
import 'navigation/main_navigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final mainNavigation = MainNavigation();
    return MaterialApp(
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.guiding,
      debugShowCheckedModeBanner: false,
    );
  }

}
