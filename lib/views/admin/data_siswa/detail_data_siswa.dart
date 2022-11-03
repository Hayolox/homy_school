import 'package:flutter/material.dart';
import 'package:homy_school/widgets/button.dart';
import 'package:homy_school/widgets/text_field_widget.dart';

import '../../../../theme.dart';

class DetailDataSiswa extends StatelessWidget {
  const DetailDataSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0XFF934bf8),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Detail Data Siswa'.toUpperCase(),
          style: poppinsTextStyle.copyWith(
              fontSize: 25,
              color: const Color(0XFF934bf8),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const TextFieldWidget(nameField: 'Nama', visible: false),
              // const SizedBox(
              //   height: 14,
              // ),
              // const TextFieldWidget(
              //     nameField: 'Jenis Pendaftaran', visible: false),
              // const SizedBox(
              //   height: 14,
              // ),
              // const TextFieldWidget(nameField: 'NISN', visible: false),
              // const SizedBox(
              //   height: 14,
              // ),
              // const TextFieldWidget(nameField: 'NIS', visible: false),
              const SizedBox(
                height: 30,
              ),
              Button(
                  nameButton: 'SIMPAN DATA',
                  widthButton: 220,
                  buttonFunction: () {})
            ],
          ),
        ),
      ),
    );
  }
}
