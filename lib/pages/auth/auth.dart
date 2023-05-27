import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth/controller/auth_controller.dart';
import 'package:flutter_application_1/widgets/button/my_button.dart';
import 'package:flutter_application_1/widgets/user_data/set_user_data.dart';
import 'package:provider/provider.dart';
import '../../navigation/main_navigation.dart';
import '../../widgets/my_text_field/my_text_field.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AuthTitle(),
              SizedBox(height: 18),
              UserDataTextFields(
                text: 'login',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthTitle extends StatelessWidget {
  const _AuthTitle();
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Авторизация',
      style: TextStyle(fontSize: 18),
    );
  }
}
