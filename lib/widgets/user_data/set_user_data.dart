import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/main_navigation.dart';
import '../../pages/auth/controller/auth_controller.dart';
import '../my_text_field/my_text_field.dart';

class UserDataTextFields extends StatelessWidget {
  final String text;
  const UserDataTextFields({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    final authController = context.read<AuthController>();
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      MyTextField(
        controller: authController.cName,
        icon: Icons.person,
        hintText: authController.cName.text,
      ),
      const SizedBox(height: 9),
      MyTextField(
        controller: authController.cAdress,
        icon: Icons.home,
        hintText: authController.cAdress.text,
      ),
      const SizedBox(height: 9),
      MyTextField(
        controller: authController.cPhone,
        icon: Icons.phone,
        hintText: authController.cPhone.text,
      ),
      const SizedBox(height: 9),
      SizedBox(height: 18),
      _Button(text: text),
    ]);
  }
}

class _Button extends StatelessWidget {
  final String text;
  const _Button({required this.text});
  @override
  Widget build(BuildContext context) {
    final controller = context.read<AuthController>();
    return InkWell(
      child: Text(text),
      onTap: () => controller.login().then(
            (value) => value as bool
                ? Navigator.of(context).pushNamed(MainNavigation().guiding)
                : ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('заполните все поля !')),
                  ),
          ),
    );
  }
}
