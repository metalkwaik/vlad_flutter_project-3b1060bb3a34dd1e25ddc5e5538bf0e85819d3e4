import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends ChangeNotifier {
List<String>? data = <String>[];
  String? imgUrl;
  final imgController = TextEditingController();

  late final SharedPreferences story;
  ProfileController(){

    getData() ;
    getImg();
  }
  getImg() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('ProfileImg')) {
      imgUrl = prefs.getString('ProfileImg');
    }
    imgController.text = '';
    notifyListeners();
  }

  upDataImg(context) async {
    if (imgController.text.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('ProfileImg', imgController.text);
      await getImg();
      Navigator.pop(context);
    } else {
      print('text is null ');
    }

  }
  getData() async {
    story = await SharedPreferences.getInstance();
    data = story.getStringList('profileData');
    notifyListeners();
  }
}
