import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../navigation/main_navigation.dart';

class AuthController extends ChangeNotifier {
  List<TextEditingController> textEdi(List<String> data) => data.map((s) {
        return TextEditingController(text: s);
      }).toList();

  Future<void> showMainPage(
      List<TextEditingController> data, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> profileData = <String>[];
    for (var element in data) {
      profileData.add(element.text);
    }
    await prefs.setStringList('profileData', profileData);
    Navigator.of(context).pushNamed(MainNavigation().initialRoute);
  }
}
