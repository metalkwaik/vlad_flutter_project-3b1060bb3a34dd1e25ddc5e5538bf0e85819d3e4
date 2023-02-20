import 'package:flutter/material.dart';
import '../page_factory/page_factory.dart';

abstract class MainNavigationRouteName {
  static const main = '/';
  static const auth = 'auth';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteName.main;
  final auth = MainNavigationRouteName.auth;

  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        initialRoute: (_) => FactoryPage().mainPage(),
        auth: (_) => FactoryPage().makeAuth(),
      };

  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(child: Text('ошибка навигации ! , ${settings.name}')),
      ),
    );
  }
}
