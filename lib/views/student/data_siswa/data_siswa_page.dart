import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homy_school/view_model.dart/data_students_view_model.dart';
import 'package:homy_school/views/student/data_siswa/detail_data_siswa.dart';
import 'package:homy_school/theme.dart';
import 'package:provider/provider.dart';

class DataSiswaPage extends StatelessWidget {
  const DataSiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lavenderColor,
      appBar: AppBar(
        backgroundColor: lavenderColor,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Data Siswa'.toUpperCase(),
          style: poppinsTextStyle.copyWith(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child:
              Consumer<DataStudentViewModel>(builder: (context, value, child) {
            return FutureBuilder(
                future:
                    value.getDetailData(FirebaseAuth.instance.currentUser!.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GestureDetector(
                      onLongPress: () {},
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailDataSiswa(uid: snapshot.data!.id),
                        ),
                      ),
                      child: Container(
                        height: 170,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 25),
                        margin: const EdgeInsets.only(top: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (snapshot.data!.data()
                                  as Map<String, dynamic>)['name'],
                              overflow: TextOverflow.ellipsis,
                              style: poppinsTextStyle.copyWith(
                                  fontSize: 18,
                                  color: lavenderColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'NISN                      : ${(snapshot.data!.data() as Map<String, dynamic>)['nisn']}',
                              style: poppinsTextStyle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'NIS                         : ${(snapshot.data!.data() as Map<String, dynamic>)['nis']}',
                              style: poppinsTextStyle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Tipe Registrasi    : ${(snapshot.data!.data() as Map<String, dynamic>)['registration_type']}',
                              style: poppinsTextStyle,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return Container();
                });
          })),
    );
  }
}
