import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth/controller/auth_controller.dart';
import 'package:flutter_application_1/pages/profile/controller/profile_controller.dart';
import 'package:flutter_application_1/widgets/my_text_field/my_text_field.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Column(
          children: const [
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

    void _showMaterialDialog(context) {
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

    Widget imgProfile() => const CircleAvatar(
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
    Widget imgUpData() => Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () => _showMaterialDialog(context),
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
    final controller = context.watch<AuthController>();
    return Expanded(
      child: Column(
        children: List.generate(
          controller.profileInfoModel.length,
          (index) => Column(
            children: [
              const SizedBox(height: 18),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: ListTile(
                  title: Text(controller.profileInfoModel[index].name),
                  leading: Icon(controller.profileInfoModel[index].icon),
                  trailing: const Icon(Icons.edit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileLogout extends StatelessWidget {
  const _ProfileLogout();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: const Center(
          child: Padding(
        padding: EdgeInsets.all(9.0),
        child: Text('data'),
      )),
    );
  }
}
