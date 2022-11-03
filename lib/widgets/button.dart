import 'package:flutter/material.dart';

import '../theme.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.nameButton,
      required this.widthButton,
      required this.buttonFunction});

  final String nameButton;
  final double widthButton;
  final Function() buttonFunction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: widthButton,
        height: 30,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0XFFd9d9d9),
          ),
          onPressed: buttonFunction,
          child: Text(
            nameButton,
            style: poppinsTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: lavenderColor,
            ),
          ),
        ),
      ),
    );
  }
}
