// ignore_for_file: constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../firebase_options.dart';

abstract class Constenst {
  static const String MAIN_URL =
      'https://database-f3419-default-rtdb.firebaseio.com';

  static const Map<String, String> LOCOL_KEY_GLOBAL_VALUE = {
    'product': '$MAIN_URL/products.json'
  };

 static const String LOCOL_KEY_DILU = 'ListPage';
 static const String LOCOL_KEY_OLATA = 'Opl';
 static const String LOCOL_KEY_RESTORAN = 'Rest';
 static const String LOCOL_KEY_INFO_DATA_RESTORAN = 'infoRestorans';



}

class Dep {
  Future<void> initFirebase() => _constructor();

  Future<void> _constructor() async {
    if (defaultTargetPlatform.name != 'windows') {
      try {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        print(' init firebase');
      } catch (e) {
        print('not init firebase');
      }
    }
  }

  Future<void> initData() async {
    Uri.parse(Constenst.LOCOL_KEY_GLOBAL_VALUE.values.first);
    Response response =
        await get(Uri.parse(Constenst.LOCOL_KEY_GLOBAL_VALUE.values.first));
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString(
          Constenst.LOCOL_KEY_GLOBAL_VALUE.keys.first, response.body);
    }
  }
}
