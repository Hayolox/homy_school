import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:homy_school/future/dialog.dart';
import 'package:homy_school/theme.dart';
import 'package:homy_school/view_model.dart/auth_view_model.dart';
import 'package:homy_school/widgets/button.dart';
import 'package:homy_school/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
          'LUPA PASSWORD',
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
                  'Masukan email untuk dikirimi\nlink pembaruan',
                  style: poppinsTextStyle.copyWith(
                      fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  nameField: 'Email',
                  visible: false,
                  c: value.emailC,
                ),
                const SizedBox(
                  height: 24,
                ),
                Button(
                    nameButton: 'Kirim Link Pembaruan',
                    widthButton: 220,
                    buttonFunction: () {
                      if (value.emailC.text != '') {
                        bool validateEmail =
                            EmailValidator.validate(value.emailC.text);
                        if (validateEmail == true) {
                          value.resetPasswordByEmail(
                              value.emailC.text, context);
                        } else {
                          FutureDialog()
                              .alert(context, 'Info', 'Format email salah');
                        }
                      } else {
                        FutureDialog()
                            .alert(context, 'Info', 'Email tidak boleh kosong');
                      }
                    }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
