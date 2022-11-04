import 'package:flutter/material.dart';
import 'package:homy_school/views/auth/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field_widget.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lavenderColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: lavenderColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(
          'GANTI PASSWORD',
          style: titleTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Consumer<AuthViewModel>(builder: (context, value, child) {
            return Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    width: 74,
                    height: 212,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/forgot-asset.png'),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Masukan password baru anda',
                  style: poppinsTextStyle.copyWith(
                      fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    nameField: 'Password Baru',
                    visible: true,
                    c: value.passwordC),
                const SizedBox(
                  height: 24,
                ),
                Button(
                    nameButton: 'Ganti Password',
                    widthButton: 220,
                    buttonFunction: () {
                      value.changePassword(value.passwordC.text, context);
                    }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
