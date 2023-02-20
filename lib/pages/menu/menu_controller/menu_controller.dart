import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../bindings/api/api_data_json.dart';
import '../../../models/item_model.dart';

enum CategoryPage { burgers, drinks, snacks }

class MenuControll extends ChangeNotifier {
  late FirebaseFirestore db;
  MenuControll() {
    _init();
  }
  List<ProductData>? _productData = [];
  List<ProductData>? get productData => _productData;
  CategoryPage categoryPageName = CategoryPage.burgers;

  late SharedPreferences _prefs;
  late Map<String, dynamic> _productMap;

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    _productMap = jsonDecode(_prefs
        .getString(Constenst.LOCOL_KEY_GLOBAL_VALUE.keys.first) as String);
    setCaterory();
  }

  setCaterory() {
    final ct = Products.fromJson(_productMap).categoris!;
    switch (categoryPageName) {
      case CategoryPage.burgers:
        _productData = ct.burgers!.products as List<ProductData>;
        break;
      case CategoryPage.drinks:
        _productData = ct.drinks!.products;
        break;
      case CategoryPage.snacks:
        _productData = ct.snacks!.products;
        break;
      default:
        _productData = [];

        print(_productData);
    }

    notifyListeners();
  }

  var currentIndexPage = 0;
  setScreen(int index) {
    categoryPageName = CategoryPage.values[index];
    currentIndexPage = index;
    setCaterory();
    notifyListeners();
  }
}
