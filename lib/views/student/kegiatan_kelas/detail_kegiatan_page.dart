import 'package:flutter/material.dart';

import '../../../../theme.dart';

class DetailKegiatanPage extends StatelessWidget {
  DetailKegiatanPage(
      {super.key, required this.title, required this.description});

  String title;
  String description;

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
          'Detail Kegiatan Kelas'.toUpperCase(),
          style: poppinsTextStyle.copyWith(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: titleTextStyle.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: Colors.white,
              ),
              Text(
                description,
                style: poppinsTextStyle.copyWith(
                    fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
