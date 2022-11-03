import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homy_school/theme.dart';
import 'package:homy_school/views/admin/data_siswa/data_siswa_page.dart';
import 'package:homy_school/views/admin/kegiatan_kelas/kegiatan_kelas_page.dart';
import 'package:homy_school/views/auth/login_page.dart';
import '../../../views/auth/change_password_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'HOMY SCHOOL',
          style: titleTextStyle.copyWith(color: lavenderColor),
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
              color: Color(0XFF934bf8),
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
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                          text: 'Admin',
                          style: poppinsTextStyle.copyWith(
                            color: lavenderColor,
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
                style: poppinsTextStyle.copyWith(fontSize: 20),
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
                      color: lavenderColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            blurRadius: 0.6,
                            spreadRadius: 0.6)
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
                            color: Colors.white),
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
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            blurRadius: 0.6,
                            spreadRadius: 0.6)
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: lavenderColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/kegiatan-kelas-asset.png'),
                      Text(
                        'Kegiatan Kelas',
                        style: poppinsTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
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
