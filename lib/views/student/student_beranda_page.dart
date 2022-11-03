import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homy_school/views/auth/login_page.dart';
import 'package:homy_school/views/student/data_siswa/data_siswa_page.dart';
import 'package:homy_school/views/student/kegiatan_kelas/kegiatan_kelas_page.dart';
import 'package:homy_school/theme.dart';
import '../auth/change_password_page.dart';

class StudentBerandaPage extends StatelessWidget {
  const StudentBerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lavenderColor,
      appBar: AppBar(
        backgroundColor: lavenderColor,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'HOMY SCHOOL',
          style: titleTextStyle.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordPage(),
                  ));
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                    text: 'Howdy, ',
                    style: poppinsTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                          text: 'Romario',
                          style: poppinsTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ))
                    ]),
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                'Silahkan memilih\nprogram',
                style: poppinsTextStyle.copyWith(
                    fontSize: 20, color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DataSiswaPage(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0, 1),
                            blurRadius: 0.9,
                            spreadRadius: 0.9)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/data-siswa-asset.png'),
                      Text(
                        'Data Siswa',
                        style: poppinsTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: lavenderColor),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KegiatanKelasPage(),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0, 1),
                            blurRadius: 0.9,
                            spreadRadius: 0.9)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/kegiatan-kelas-asset.png'),
                      Text(
                        'Kegiatan Kelas',
                        style: poppinsTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: lavenderColor),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const LoginPage(),
                      ),
                    );
                    await FirebaseAuth.instance.signOut();
                  },
                  child: const Text("Logout"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
