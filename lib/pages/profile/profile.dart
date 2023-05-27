import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth/controller/auth_controller.dart';
import 'package:flutter_application_1/pages/profile/controller/profile_controller.dart';
import 'package:flutter_application_1/widgets/button/my_button.dart';
import 'package:flutter_application_1/widgets/my_text_field/my_text_field.dart';
import 'package:flutter_application_1/widgets/user_data/set_user_data.dart';
import 'package:provider/provider.dart';

import '../../navigation/main_navigation.dart';
import '../auth/auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9),
        child: ListView(
          shrinkWrap: true,
          children: [
            _ProfileHeader(),
            _ProfileBody(),
            _ProfileLogout(),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProfileController>();

    void showMaterialDialog(context) {
      showDialog(
          context: context,
          builder: (context) {
            context = context;
            return AlertDialog(
              title: MyTextField(
                hintText: 'URl',
                controller: controller.imgController,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => controller.upDataImg(context),
                  child: const Text('Применить'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Закрыть'),
                ),
              ],
            );
          });
    }

    Widget imgProfile() {
      return const CircleAvatar(
        backgroundColor: Colors.teal,
        radius: 50,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 48,
          child: Icon(
            Icons.image,
            size: 18 * 3,
            color: Colors.teal,
          ),
        ),
      );
    }

    Widget imgUpData() {
      return Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: () => showMaterialDialog(context),
          child: const CircleAvatar(
            backgroundColor: Colors.red,
            radius: 17,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15,
              child: Icon(
                Icons.add,
                size: 18,
                color: Colors.red,
              ),
            ),
          ),
        ),
      );
    }

    return controller.imgUrl == null
        ? Stack(
            children: [
              imgProfile(),
              imgUpData(),
            ],
          )
        : Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(controller.imgUrl.toString()),
                radius: 60,
              ),
              imgUpData(),
            ],
          );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();
  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();
    final profileController = context.watch<ProfileController>();
    Widget textFildEdit(String value) {
      return ListTile(
        title: Row(
          children: [
            Text('$value : '),
            const SizedBox(width: 9),
            Text(authController.user[value] ?? '')
          ],
        ),
      );
    }

    List<String> userData = ['name', 'adres', 'phone'];
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Column(
            // shrinkWrap: true,
            children: profileController.editUser
                ? List.generate(
                    userData.length, (index) => textFildEdit(userData[index]))
                : [_EditUserDataTextFields()],
          ),
          TextButton(
            onPressed: () => profileController.togEdit(),
            child: Text(profileController.editUser ? 'edit' : 'close'),
          )
        ],
      ),
    );
  }
}

class _ProfileLogout extends StatelessWidget {
  const _ProfileLogout();
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuthController>();
    return TextButton(
      onPressed: () async {
        await controller.logout().then((value) =>
            Navigator.of(context).pushNamed(MainNavigation().guiding));
      },
      child: const Text('logut'),
    );
  }
}

class _EditUserDataTextFields extends StatelessWidget {
  const _EditUserDataTextFields();
  @override
  Widget build(BuildContext context) {
    final authController = context.read<AuthController>();
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      MyTextField(
        controller: authController.cName,
        icon: Icons.person,
        hintText: authController.user['name'],
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
      _Button(),
    ]);
  }
}

class _Button extends StatelessWidget {

  const _Button();
  @override
  Widget build(BuildContext context) {
    final controller = context.read<AuthController>();
    return InkWell(
      child: const Text('save'),
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
