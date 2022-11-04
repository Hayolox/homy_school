import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homy_school/views/admin/kegiatan_kelas/class_activities_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../theme.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/text_field_widget.dart';

class DetailKegiatanPage extends StatelessWidget {
  DetailKegiatanPage({super.key, this.idDoc});

  String? idDoc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        leading: Consumer<ClassActivitiesViewModel>(
            builder: (context, value, child) {
          return IconButton(
            onPressed: () {
              Navigator.pop(context);
              value.nameActivitiesC.clear();
              value.desctiprionActivitiesC.clear();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0XFF934bf8),
            ),
          );
        }),
        centerTitle: true,
        title: Text(
          'Detail Kegiatan Kelas'.toUpperCase(),
          style: poppinsTextStyle.copyWith(
              fontSize: 25,
              color: const Color(0XFF934bf8),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Consumer<ClassActivitiesViewModel>(
              builder: (context, value, child) {
            return FutureBuilder<DocumentSnapshot<Object?>>(
                future: value.getDetailData(idDoc!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    value.nameActivitiesC.text =
                        (snapshot.data!.data() as Map<String, dynamic>)['name'];
                    value.desctiprionActivitiesC.text = (snapshot.data!.data()
                        as Map<String, dynamic>)['description'];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldWidget(
                          visible: false,
                          c: value.nameActivitiesC,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextFieldWidget(
                          visible: false,
                          c: value.desctiprionActivitiesC,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Button(
                          nameButton: 'EDIT DATA',
                          widthButton: 220,
                          buttonFunction: () {
                            value.editData(
                                value.nameActivitiesC.text,
                                value.desctiprionActivitiesC.text,
                                idDoc!,
                                context);
                          },
                        )
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
          }),
        ),
      ),
    );
  }
}
