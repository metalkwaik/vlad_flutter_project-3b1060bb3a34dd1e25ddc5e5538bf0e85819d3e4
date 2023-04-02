import 'package:flutter/material.dart';
import '../../../navigation/main_navigation.dart';
import '../model/profile_info_model.dart';

class AuthController extends ChangeNotifier {
  AuthController() {
    initProfileInfoData();
  }
  List<TextEditingController> textEdi() => ProfileInfo.titles.map((s) {
        return TextEditingController(text: s);
      }).toList();
  final List<ProfileInfoModel> _profileInfoModel = [];
  List<ProfileInfoModel> get profileInfoModel => _profileInfoModel.toList();
  void initProfileInfoData() {
    if (_profileInfoModel != []) {
      List.generate(
        ProfileInfo.titles.length,
        (index) {
          _profileInfoModel.add(
            ProfileInfoModel(
              ProfileInfo.icons[index],
              name: textEdi()[index].text,
            ),
          );
        },
      );
    }
  }

  void showMainPage(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigation().initialRoute);
  }
}
