import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:homy_school/future/dialog.dart';

class ClassActivitiesViewModel extends ChangeNotifier {
  TextEditingController nameActivitiesC = TextEditingController();
  TextEditingController desctiprionActivitiesC = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  bool isLoading = true;

  Stream<QuerySnapshot> getData() {
    final Stream<QuerySnapshot> usersStream =
        FirebaseFirestore.instance.collection('class-activities').snapshots();

    return usersStream;
  }

  Future<DocumentSnapshot<Object?>> getDetailData(String paramId) async {
    DocumentReference docRef = db.collection('class-activities').doc(paramId);

    return docRef.get();
  }

  void addData(
      String paramName, String paramDescription, BuildContext context) async {
    CollectionReference dataClassActivities = db.collection('class-activities');

    if (paramName.isNotEmpty || paramDescription.isNotEmpty) {
      await dataClassActivities.add(
        {
          'description': paramDescription,
          'name': paramName,
        },
      );
      // ignore: use_build_context_synchronously
      FutureDialog()
          .alert(context, 'Succes!', 'Berhasil Menambahkan Kegiatan Kelas');
    } else {
      FutureDialog()
          .alert(context, 'Info!', 'Name atau Description Tidak Boleh kosong');
    }

    nameActivitiesC.clear();
    desctiprionActivitiesC.clear();
  }

  editData(String paramName, String paramDescription, String paramId,
      BuildContext context) async {
    DocumentReference dataClassActivities =
        db.collection('class-activities').doc(paramId);

    if (paramName.isNotEmpty || paramDescription.isNotEmpty) {
      await dataClassActivities.update(
        {
          'description': paramDescription,
          'name': paramName,
        },
      );

      nameActivitiesC.clear();
      desctiprionActivitiesC.clear();
      // ignore: use_build_context_synchronously
      FutureDialog()
          .alert(context, 'Succes!', 'Berhasil Mengedit Kegiatan Kelas');
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } else {
      FutureDialog()
          .alert(context, 'Info!', 'Name atau Description Tidak Boleh kosong');
    }
  }

  void deleteData(String paramIdDoc) async {
    await db.collection("class-activities").doc(paramIdDoc).delete();
    notifyListeners();
  }
}
