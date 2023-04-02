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
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _TitleAuth(),
              SizedBox(height: 18),
              _AuthBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleAuth extends StatelessWidget {
  const _TitleAuth();
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Окно входа',
      style: TextStyle(fontSize: 18),
    );
  }
}

class _AuthBody extends StatelessWidget {
  const _AuthBody();
  @override
  Widget build(BuildContext context) {
    final controller = context.read<AuthController>();
    final listTextControll = controller.textEdi();
    Widget authSubmit() => MyButton(
          text: 'Вход',
          fun: () => controller.showMainPage(
            context,
          ),
        );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...List.generate(
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
        const SizedBox(height: 9),
        authSubmit(),
        const SizedBox(height: 18),
      ],
    );

  }
}
