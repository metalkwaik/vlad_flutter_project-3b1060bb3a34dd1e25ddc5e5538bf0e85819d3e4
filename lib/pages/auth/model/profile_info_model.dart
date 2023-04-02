import 'package:flutter/material.dart';

abstract class ProfileInfo {
  static const titles = <String>['name', 'adress', 'phone'];
  static const icons = <IconData>[Icons.person, Icons.home, Icons.phone];
}

class ProfileInfoModel {
  final String name;
  final IconData? icon;
  ProfileInfoModel(
    this.icon, {
    required this.name,
  });
}
