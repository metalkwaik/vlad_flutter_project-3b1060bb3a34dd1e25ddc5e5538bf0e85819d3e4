import 'package:flutter/material.dart';

abstract class ProfileInfo {
  static const titles = <String>['login', 'pass'];
  static const icons = <IconData>[Icons.person, Icons.https];
}

class ProfileInfoModel {
  final String name;
  final IconData? icon;
  ProfileInfoModel(
    this.icon, {
    required this.name,
  });
}
