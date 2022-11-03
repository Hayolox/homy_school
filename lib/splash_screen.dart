import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homy_school/views/admin/beranda_page.dart';
import 'package:homy_school/views/auth/auth_view_model.dart';
import 'package:homy_school/views/auth/login_page.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      final viewModel = Provider.of<AuthViewModel>(context, listen: false);
      viewModel.checkLogin();
    });
    return Scaffold(
      body: Center(
        child: DelayedDisplay(
          delay: const Duration(seconds: 1),
          child: Image.asset(
            'assets/images/homy-school.png',
            height: 250,
          ),
        ),
      ),
    );
  }
}
