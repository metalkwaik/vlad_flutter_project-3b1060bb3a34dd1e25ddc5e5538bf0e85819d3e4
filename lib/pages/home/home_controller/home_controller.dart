import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bindings/api/api_data_json.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Opl { nal, cart }

enum ListPage { dostavks, samov }

class HomeController extends ChangeNotifier {
  late final SharedPreferences prefs;
  HomeController() {
    _initLocalData();
}

  Opl sposopOpl = Opl.nal;
  int selectedIndexPickupAdress = -1;
  Future<void> _initLocalData() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(Constenst.LOCOL_KEY_RESTORAN)) {
      selectedIndexPickupAdress = prefs.getInt(Constenst.LOCOL_KEY_RESTORAN)!;
    }

    switch (prefs.getString(Constenst.LOCOL_KEY_DILU)) {
      case 'dostavks':
        setScreen(0);
        break;
      case 'samov':
        setScreen(1);
        break;
      default:
    }

    switch (prefs.getString(Constenst.LOCOL_KEY_OLATA)) {
      case 'nal':
        sposopOpl = Opl.nal;
        break;
      case 'cart':
        sposopOpl = Opl.cart;
        break;
      default:
        sposopOpl = Opl.nal;
    }
  }

  setPay(Opl? value) {
    sposopOpl = value!;
    prefs.setString(Constenst.LOCOL_KEY_OLATA, value.name);
    notifyListeners();
  }

  var currentIndexPage = 0;

  List<InfoRestorans> listInfoRestorans = [];

  Future<void> togSelectPickup(index) async {
    await prefs.setInt(Constenst.LOCOL_KEY_RESTORAN, index);

    selectedIndexPickupAdress = index;
    notifyListeners();
  }

  setScreen(int index) async {
    currentIndexPage = index;
    await prefs.setString(
        Constenst.LOCOL_KEY_DILU, ListPage.values[index].name);
    if (currentIndexPage == 1) {
      listInfoRestorans = [];
      _initDataRest();
    }
    notifyListeners();
  }

  Future<void> _initDataRest() async {
    try {
      listInfoRestorans = [];
    final db = FirebaseFirestore.instance;

      CollectionReference collectionRef =
          db.collection(Constenst.LOCOL_KEY_INFO_DATA_RESTORAN);

    QuerySnapshot querySnapshot = await collectionRef.get();
    querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList()
          .forEach((element) {
      final nowTime = double.parse(DateFormat("HH.mm").format(DateTime.now()));
      final timePeriod = element['dataTime']['time'];
      final restTimeOpen = double.parse(timePeriod.substring(0, 5));
      final restTimeClose = double.parse(timePeriod.substring(8));
        bool isOpen = nowTime > restTimeOpen && nowTime < restTimeClose;
      listInfoRestorans.add(
        InfoRestorans(
          adres: element['adres'],
          dataTime: element['dataTime'],
          status: isOpen,
        ),
      );
    });
    notifyListeners();
    } catch (e) {}
  }
}

class InfoRestorans {
  final String adres;
  final Map<String, dynamic> dataTime;
  final bool status;
  InfoRestorans({
    required this.status,
    required this.adres,
    required this.dataTime,
  });
}
