import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/guiding/controller/guiding_controller.dart';
import 'package:provider/provider.dart';

class GuidingPage extends StatelessWidget {
  const GuidingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: context.watch<GuidingController>().setPage(),
            builder: (context, AsyncSnapshot<Widget> snapshot) {
              return snapshot.hasData
                  ? snapshot.data!
                  : const CircularProgressIndicator();
            }),
      ),
    );
  }
}
