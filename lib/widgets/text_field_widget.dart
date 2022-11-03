import 'package:flutter/material.dart';

import '../theme.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key, this.nameField, required this.visible, required this.c});

  final String? nameField;
  final bool visible;
  TextEditingController c;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: visible,
      controller: c,
      keyboardType: TextInputType.emailAddress,
      style: poppinsTextStyle.copyWith(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        hintText: nameField,
        hintStyle: poppinsTextStyle.copyWith(color: Colors.white),
        filled: true,
        fillColor: const Color(0XFFb793e8),
      ),
    );
  }
}
