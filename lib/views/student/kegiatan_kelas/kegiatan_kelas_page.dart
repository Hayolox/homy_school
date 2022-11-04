import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homy_school/view_model.dart/class_activities_view_model.dart';
import 'package:homy_school/views/student/kegiatan_kelas/detail_kegiatan_page.dart';

import 'package:homy_school/theme.dart';
import 'package:provider/provider.dart';

class KegiatanKelasPage extends StatelessWidget {
  const KegiatanKelasPage({super.key});

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
          'Kegiatan Kelas'.toUpperCase(),
          style: poppinsTextStyle.copyWith(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Consumer<ClassActivitiesViewModel>(
            builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                onChanged: (val) {
                  value.changeNameClassActivities(val);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              StreamBuilder(
                stream: value.getData(),
                builder: (context, snapshot) {
                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              if (value.nameClassActivities.isEmpty) {
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailKegiatanPage(
                                        title: (snapshot.data!.docs[index]
                                                .data()
                                            as Map<String, dynamic>)['name'],
                                        description:
                                            (snapshot.data!.docs[index].data()
                                                    as Map<String, dynamic>)[
                                                'description'],
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 25),
                                    margin: const EdgeInsets.only(top: 15),
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            (snapshot.data!.docs[index].data()
                                                    as Map<String, dynamic>)[
                                                'name'],
                                            overflow: TextOverflow.ellipsis,
                                            style: poppinsTextStyle.copyWith(
                                                fontSize: 18,
                                                color: lavenderColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Divider(
                                          color: lavenderColor,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            (snapshot.data!.docs[index].data()
                                                    as Map<String, dynamic>)[
                                                'description'],
                                            overflow: TextOverflow.ellipsis,
                                            style: poppinsTextStyle,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }

                              if ((snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>)['name']
                                  .toString()
                                  .toLowerCase()
                                  .startsWith(value.nameClassActivities
                                      .toLowerCase())) {
                                return GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailKegiatanPage(
                                        title: (snapshot.data!.docs[index]
                                                .data()
                                            as Map<String, dynamic>)['name'],
                                        description:
                                            (snapshot.data!.docs[index].data()
                                                    as Map<String, dynamic>)[
                                                'description'],
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 25),
                                    margin: const EdgeInsets.only(top: 15),
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            (snapshot.data!.docs[index].data()
                                                    as Map<String, dynamic>)[
                                                'name'],
                                            overflow: TextOverflow.ellipsis,
                                            style: poppinsTextStyle.copyWith(
                                                fontSize: 18,
                                                color: lavenderColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Divider(
                                          color: lavenderColor,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            (snapshot.data!.docs[index].data()
                                                    as Map<String, dynamic>)[
                                                'description'],
                                            overflow: TextOverflow.ellipsis,
                                            style: poppinsTextStyle,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                        );
                },
              )
            ],
          );
        }),
      ),
    );
  }
}
