import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homy_school/firebase_options.dart';
import 'package:homy_school/splash_screen.dart';
import 'package:homy_school/views/auth/auth_view_model.dart';
import 'package:homy_school/views/auth/login_page.dart';
import 'package:homy_school/views/model_view/class_activities_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthViewModel>(
        create: (context) => AuthViewModel(),
      ),
      ChangeNotifierProvider<ClassActivitiesViewModel>(
        create: (context) => ClassActivitiesViewModel(),
      ),
    ],
    child: const HomySchool(),
  ));
}

class HomySchool extends StatelessWidget {
  const HomySchool({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (context, value, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: value.widgetNow,
      );
    });
  }
}
