import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth/controller/auth_controller.dart';
import 'package:flutter_application_1/widgets/button/my_button.dart';
import 'package:provider/provider.dart';
import '../../widgets/my_text_field/my_text_field.dart';
import 'model/profile_info_model.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _AuthTitle(),
              SizedBox(height: 18),
              _AuthTextFields(),
              SizedBox(height: 18),
              _AuthButton(),
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
/// удалить колонны , подумать как экономнее написать
class _AuthTextFields extends StatelessWidget {
  const _AuthTextFields();
  @override
  Widget build(BuildContext context) {
    final listTextControll = context.read<AuthController>().textEdi();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
          ProfileInfo.titles.length,
          (index) => Column(
            children: [
              MyTextField(
                controller: listTextControll[index],
                icon: ProfileInfo.icons.length > index
                    ? ProfileInfo.icons[index]
                    : null,
                hintText: ProfileInfo.titles[index],
              ),
              const SizedBox(height: 9),
            ],
          ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton();
  @override
  Widget build(BuildContext context) {
    final controller = context.read<AuthController>();
    return MyButton(
      text: 'Вход',
      fun: () => controller.showMainPage(context),
    );
  }
}
