import 'package:flutter/cupertino.dart';

class PagesController extends ChangeNotifier {
  var currentIndexPage = 0;

  setScreen(int index) {
    currentIndexPage = index;
    notifyListeners();
  }
}
