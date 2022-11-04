import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:homy_school/future/dialog.dart';
import 'package:homy_school/views/admin/data_siswa/data_siswa_page.dart';
import 'package:homy_school/views/admin/data_siswa/data_students_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../theme.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/text_field_widget.dart';

class AddSiswaPage extends StatelessWidget {
  const AddSiswaPage({super.key});

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
          'Add Data Siswa'.toUpperCase(),
          style: poppinsTextStyle.copyWith(
              fontSize: 25,
              color: const Color(0XFF934bf8),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child:
              Consumer<DataStudentViewModel>(builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  nameField: 'Email',
                  visible: false,
                  c: value.emailC,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFieldWidget(
                  nameField: 'Nama',
                  visible: false,
                  c: value.nameC,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFieldWidget(
                  nameField: 'Jenis Pendaftaran',
                  visible: false,
                  c: value.registrationTypeC,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextField(
                  controller: value.nisnC,
                  keyboardType: TextInputType.number,
                  style: poppinsTextStyle.copyWith(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    hintText: 'NISN',
                    hintStyle: poppinsTextStyle.copyWith(color: Colors.white),
                    filled: true,
                    fillColor: const Color(0XFFb793e8),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextField(
                  controller: value.nisC,
                  keyboardType: TextInputType.number,
                  style: poppinsTextStyle.copyWith(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    hintText: 'NIS',
                    hintStyle: poppinsTextStyle.copyWith(color: Colors.white),
                    filled: true,
                    fillColor: const Color(0XFFb793e8),
                  ),
                ),
                Button(
                    nameButton: 'TAMBAH DATA',
                    widthButton: 220,
                    buttonFunction: () {
                      bool validateEmail =
                          EmailValidator.validate(value.emailC.text);

                      if (value.emailC.text.isEmpty && validateEmail == false) {
                        FutureDialog().alert(context, 'Info!',
                            'Email Tidak Boleh Kosong atau email tidak sesuai format');
                        FutureDialog().alert(context, 'Info!',
                            'Email Tidak Boleh Kosong atau email tidak sesuai format');
                      } else if (value.nameC.text.isEmpty) {
                        FutureDialog()
                            .alert(context, 'Info!', 'Name Tidak Boeh Kosong');
                      } else if (value.nisC.text.isEmpty) {
                        FutureDialog()
                            .alert(context, 'Info!', 'NIS Tidak Boeh Kosong');
                      } else if (value.nisnC.text.isEmpty) {
                        FutureDialog()
                            .alert(context, 'Info!', 'NISN Tidak Boeh Kosong');
                      } else if (value.registrationTypeC.text.isEmpty) {
                        FutureDialog().alert(context, 'Info!',
                            'Tipe Registrasi Tidak Boeh Kosong');
                      } else {
                        value.addData(
                            value.emailC.text,
                            value.nameC.text,
                            value.nisC.text,
                            value.nisnC.text,
                            value.registrationTypeC.text,
                            context);
                      }
                    })
              ],
            );
          }),
        ),
      ),
    );
  }
}
