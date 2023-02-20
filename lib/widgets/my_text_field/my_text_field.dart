import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  const MyTextField(
      {super.key, this.hintText = '', this.icon, this.controller});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(
        minLines: 1,
        maxLines: 10,
        controller: controller,
        scrollPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: Colors.white,
          hintText: hintText,
          prefixIcon: icon != null ? Icon(icon, size: 18) : null,
          border: const OutlineInputBorder(),

          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
