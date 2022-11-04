import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:homy_school/future/dialog.dart';
import 'package:homy_school/views/admin/data_siswa/data_students_view_model.dart';
import 'package:homy_school/widgets/button.dart';
import 'package:homy_school/widgets/text_field_widget.dart';
import 'package:provider/provider.dart';

import '../../../../theme.dart';

class DetailDataSiswa extends StatelessWidget {
  DetailDataSiswa({super.key, this.uid});

  String? uid;

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
          child:
              Consumer<DataStudentViewModel>(builder: (context, value, child) {
            return FutureBuilder(
                future: value.getDetailData(uid!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    value.nameC.text =
                        (snapshot.data!.data() as Map<String, dynamic>)['name'];
                    value.registrationTypeC.text = (snapshot.data!.data()
                        as Map<String, dynamic>)['registration_type'];
                    value.nisnC.text =
                        (snapshot.data!.data() as Map<String, dynamic>)['nisn'];
                    value.nisC.text =
                        (snapshot.data!.data() as Map<String, dynamic>)['nis'];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 14,
                        ),
                        TextFieldWidget(
                          visible: false,
                          c: value.nameC,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextFieldWidget(
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
                            hintStyle:
                                poppinsTextStyle.copyWith(color: Colors.white),
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
                            hintStyle:
                                poppinsTextStyle.copyWith(color: Colors.white),
                            filled: true,
                            fillColor: const Color(0XFFb793e8),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Button(
                            nameButton: 'SIMPAN DATA',
                            widthButton: 220,
                            buttonFunction: () {
                              if (value.nameC.text.isEmpty) {
                                FutureDialog().alert(
                                    context, 'Info!', 'Name Tidak Boeh Kosong');
                              } else if (value.nisC.text.isEmpty) {
                                FutureDialog().alert(
                                    context, 'Info!', 'NIS Tidak Boeh Kosong');
                              } else if (value.nisnC.text.isEmpty) {
                                FutureDialog().alert(
                                    context, 'Info!', 'NISN Tidak Boeh Kosong');
                              } else if (value.registrationTypeC.text.isEmpty) {
                                FutureDialog().alert(context, 'Info!',
                                    'Tipe Registrasi Tidak Boeh Kosong');
                              } else {
                                value.editData(
                                    value.emailC.text,
                                    value.nameC.text,
                                    value.nisC.text,
                                    value.nisnC.text,
                                    value.registrationTypeC.text,
                                    uid!,
                                    context);
                              }
                            })
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
