import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  TextEditingController cName = TextEditingController();
  TextEditingController cAdress = TextEditingController();
  TextEditingController cPhone = TextEditingController();
  AuthController() {
    getUser();
  }
  late SharedPreferences prefs;
  late Map<String, dynamic> user = {};

  Future<bool?> login() async {
    prefs = await SharedPreferences.getInstance();

    if (cName.text.trim() != '' &&
        cAdress.text.trim() != '' &&
        cPhone.text.trim() != '') {
      user = {
        'name': cName.text,
        'adres': cAdress.text,
        'phone': cPhone.text,
      };

      prefs.setString("user", json.encode(user));
      getUser();
      return true;
    }
    print('object');
    return false;
  }

  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String stringMap = pref.getString('user').toString();
    user = json.decode(stringMap) as Map<String, dynamic>;
    print('qwe');
    notifyListeners();
  }

  Future<void> logout() async {
    user = {};
    prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}
