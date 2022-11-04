import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homy_school/future/dialog.dart';
import 'package:homy_school/splash_screen.dart';
import 'package:homy_school/views/admin/beranda_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homy_school/views/auth/change_password_page.dart';
import 'package:homy_school/views/auth/login_page.dart';
import 'package:homy_school/views/student/student_beranda_page.dart';

class AuthViewModel extends ChangeNotifier {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  late Widget widgetNow = const SplashScreen();

  void login(
      String paramEmail, String paramPassword, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: paramEmail, password: paramPassword);
      User user = auth.currentUser!;
      final uid = user.uid;
      final docRef = db.collection("roles").doc(uid);
      docRef.get().then(
        (DocumentSnapshot doc) {
          if (doc.data() != null) {
            final data = doc.data() as Map<String, dynamic>;
            if (data['name'] == 'admin') {
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const BerandaPage(),
                ),
              );
            } else {
              Navigator.pushReplacement<void, void>(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const StudentBerandaPage(),
                ),
              );
            }
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        FutureDialog().alert(
            context, 'Info!', 'User tidak ditemukan, silahkan daftar akun');
      } else if (e.code == 'wrong-password') {
        FutureDialog().alert(context, 'Info!', 'Password Salah');
      }
    }
    emailC.clear();
    passwordC.clear();
  }

  void resetPasswordByEmail(String paramEmail, BuildContext context) async {
    await auth.sendPasswordResetEmail(email: paramEmail);
    // ignore: use_build_context_synchronously
    FutureDialog()
        .alert(context, 'Info!', 'Sudah dikiran ke email, silahkan lihat spam');
    emailC.clear();
  }

  Widget checkLogin() {
    Timer(
      const Duration(seconds: 2),
      () {
        FirebaseAuth.instance.authStateChanges().listen(
          (User? user) async {
            if (user == null) {
              widgetNow = const LoginPage();
              notifyListeners();
            } else {
              final FirebaseAuth auth = FirebaseAuth.instance;
              final User? user = auth.currentUser;
              final uid = user!.uid;
              FirebaseFirestore db = FirebaseFirestore.instance;
              final docRef = db.collection("roles").doc(uid);
              docRef.get().then(
                (DocumentSnapshot doc) {
                  if (doc.data() != null) {
                    final data = doc.data() as Map<String, dynamic>;
                    if (data['name'] == 'admin') {
                      widgetNow = const BerandaPage();
                      notifyListeners();
                    } else {
                      widgetNow = const StudentBerandaPage();
                      notifyListeners();
                    }
                  }
                },
              );
            }
          },
        );
      },
    );

    return widgetNow;
  }

  void changePassword(String paramPassword, BuildContext context) async {
    await FirebaseAuth.instance.currentUser!.updatePassword(paramPassword);
    passwordC.clear();
    // ignore: use_build_context_synchronously
    FutureDialog().alert(context, 'Succes', 'Password Sudah Diganti');
  }
}
