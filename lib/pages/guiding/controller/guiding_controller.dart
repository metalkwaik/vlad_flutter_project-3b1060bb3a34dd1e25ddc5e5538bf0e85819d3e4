import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../bindings/api/api_data_json.dart';
import '../../../page_factory/page_factory.dart';

enum InternetStatus { good, error }

class GuidingController extends ChangeNotifier {
  Future<InternetStatus> _internetStatus() async {
    InternetStatus status = InternetStatus.good;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        status = InternetStatus.good;
      }
    } on SocketException catch (_) {
      status = InternetStatus.error;
    }
    return status;
  }

  Map<String, dynamic> user = {};
  Future<Widget> setPage() async {
    final shared = await SharedPreferences.getInstance();
    if (shared.containsKey('user')) {
      user = json.decode(shared.getString('user').toString());

      switch (await _internetStatus()) {
        case InternetStatus.error:
          return const Text('internet error');

        case InternetStatus.good:
          if (user.isEmpty) {
            return FactoryPage().makeAuth();
          } else {
            Dep.instance;
            return FactoryPage().mainPage();
          }

        default:
          return const Placeholder(child: Text('load error'));
      }
    } else {
      return FactoryPage().makeAuth();
    }
  }
}
