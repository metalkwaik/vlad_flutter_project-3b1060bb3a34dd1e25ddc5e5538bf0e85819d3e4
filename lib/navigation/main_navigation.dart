import 'package:flutter/material.dart';
import '../page_factory/page_factory.dart';

abstract class MainNavigationRouteName {
  static const main = '/';
  static const guiding = '/guiding';
  static const auth = '/auth';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteName.main;
  final auth = MainNavigationRouteName.auth;
  final guiding = MainNavigationRouteName.guiding;

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        initialRoute: (_) => FactoryPage().mainPage(),
        auth: (_) => FactoryPage().makeAuth(),
        guiding: (_) => FactoryPage().makeGuiding(),
      };

  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(child: Text('ошибка навигации ! , ${settings.name}')),
      ),
    );
  }
}
