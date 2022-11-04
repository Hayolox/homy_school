import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:homy_school/future/dialog.dart';

class DataStudentViewModel extends ChangeNotifier {
  TextEditingController emailC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController registrationTypeC = TextEditingController();
  TextEditingController nisC = TextEditingController();
  TextEditingController nisnC = TextEditingController();

  String nameDataStudents = '';

  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getData() {
    final Stream<QuerySnapshot> usersStream =
        FirebaseFirestore.instance.collection('data-students').snapshots();

    return usersStream;
  }

  Future<DocumentSnapshot<Object?>> getDetailData(String paramId) async {
    DocumentReference docRef = db.collection('data-students').doc(paramId);

    return docRef.get();
  }

  addData(
      String paramEmail,
      String paramName,
      String paramNis,
      String paramNisn,
      String paramRegistrationType,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: paramEmail, password: '123456');
      await db
          .collection('roles')
          .doc(userCredential.user!.uid)
          .set({'name': 'student'});

      await db.collection('data-students').doc(userCredential.user!.uid).set(
        {
          'name': paramName,
          'nis': paramNis,
          'nisn': paramNisn,
          'registration_type': paramRegistrationType,
        },
      );
      // ignore: use_build_context_synchronously
      FutureDialog()
          .alert(context, 'Succes!', 'Berhasil Menambahkan Data Student');
      // ignore: use_build_context_synchronously

      emailC.clear();
      nameC.clear();
      nisC.clear();
      nisnC.clear();
      registrationTypeC.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        FutureDialog().alert(context, 'Info!', 'Email Sudah Tersedia');
      }
    }
  }

  editData(
      String paramEmail,
      String paramName,
      String paramNis,
      String paramNisn,
      String paramRegistrationType,
      String paramId,
      BuildContext context) async {
    await db.collection('data-students').doc(paramId).update(
      {
        'name': paramName,
        'nis': paramNis,
        'nisn': paramNisn,
        'registration_type': paramRegistrationType,
      },
    );

    emailC.clear();
    nameC.clear();
    nisC.clear();
    nisnC.clear();
    registrationTypeC.clear();
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  changeNameDataStudents(String paramValue) {
    nameDataStudents = paramValue;
    notifyListeners();
  }

  void deleteData(String paramIdDoc) async {
    await db.collection("data-students").doc(paramIdDoc).delete();
    await db.collection("roles").doc(paramIdDoc).delete();
  }
}
