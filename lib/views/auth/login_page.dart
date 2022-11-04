import 'package:flutter/material.dart';
import 'package:homy_school/future/dialog.dart';
import 'package:homy_school/views/admin/beranda_page.dart';
import 'package:homy_school/view_model.dart/auth_view_model.dart';
import 'package:homy_school/theme.dart';
import 'package:homy_school/views/auth/forgot_password_page.dart';
import 'package:homy_school/widgets/button.dart';
import 'package:homy_school/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg-purple.png'),
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child:
                    Consumer<AuthViewModel>(builder: (context, value, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'MASUK',
                          style: titleTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFieldWidget(
                        nameField: 'Email',
                        visible: false,
                        c: value.emailC,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFieldWidget(
                        nameField: 'Password',
                        visible: true,
                        c: value.passwordC,
                      ),
                      Button(
                          nameButton: 'Masuk',
                          widthButton: 93,
                          buttonFunction: () {
                            if (value.emailC.text != '' &&
                                value.passwordC.text != '') {
                              bool validateEmail =
                                  EmailValidator.validate(value.emailC.text);

                              if (validateEmail == true) {
                                value.login(value.emailC.text,
                                    value.passwordC.text, context);
                              } else {
                                FutureDialog().alert(
                                    context, 'Info!', 'Format email salah');
                              }
                            } else {
                              FutureDialog().alert(context, 'Info!',
                                  'Email Atau Password Tidak Boleh Kosong');
                            }
                          }),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ForgotPasswordPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Lupa Password?',
                            style: poppinsTextStyle.copyWith(
                              fontSize: 12,
                              color: const Color(0XFFFFFEFE),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 246,
                        height: 160,
                        margin: const EdgeInsets.symmetric(vertical: 65),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/login-asset.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
