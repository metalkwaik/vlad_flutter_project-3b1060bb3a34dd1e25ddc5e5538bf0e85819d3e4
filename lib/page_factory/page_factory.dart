import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/pages/menu/menu.dart';
import 'package:flutter_application_1/pages/profile/profile.dart';
import 'package:flutter_application_1/pages/stac_page/stac_pages.dart';
import 'package:flutter_application_1/pages/stac_page/stac_page_controller.dart/pages_controller.dart';
import 'package:provider/provider.dart';

import '../pages/auth/auth.dart';
import '../pages/auth/controller/auth_controller.dart';
import '../pages/cart/cart.dart';
import '../pages/cart/cart_controlle/cart_controller.dart';
import '../pages/home/home.dart';
import '../pages/home/home_controller/home_controller.dart';
import '../pages/menu/menu_controller/menu_controller.dart';
import '../pages/profile/controller/profile_controller.dart';

class FactoryPage {
  Widget mainPage() => MultiProvider(
        providers: [
          ChangeNotifierProvider<PagesController>(
            create: (_) => PagesController(),
          ),
          ChangeNotifierProvider<CartController>(
            create: (_) => CartController(),
          ),
          ChangeNotifierProvider<AuthController>(
            create: (_) => AuthController(),
          ),

        ],
        child: const StacPages(),
      );

  Widget makeMenu() => ChangeNotifierProvider(
        create: (_) => MenuControll(),
        child: const MenuPage(),
      );

  Widget makeCart() => const CartPage();
 Widget makeProfile() => ChangeNotifierProvider(
        create: (_) =>ProfileController(),
        child: const ProfilePage(),
      );
  Widget makeHome() => ChangeNotifierProvider(
        create: (_) => HomeController(),
        child: const HomePage(),
      );

  Widget makeAuth() => ChangeNotifierProvider(
        create: (_) => AuthController(),
        child: const AuthPage(),
      );
}
