import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final IconData? icon;
  final TextEditingController? controller;
  const MyTextField(
      {super.key, this.hintText, this.label, this.icon, this.controller});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(

        minLines: 1,
        maxLines: 10,
        controller: controller,
        scrollPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          isDense: true,
          fillColor: Colors.white,
          hintText: hintText ?? controller?.text,
          prefixIcon: icon != null ? Icon(icon, size: 18) : null,
          border: const OutlineInputBorder(),
          hintStyle: const TextStyle(color: Colors.black45),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
