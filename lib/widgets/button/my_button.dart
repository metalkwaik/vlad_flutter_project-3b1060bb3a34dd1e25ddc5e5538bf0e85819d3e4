import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function()? fun;
  const MyButton({super.key, this.fun, required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: BoxDecoration(border: Border.all()),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
