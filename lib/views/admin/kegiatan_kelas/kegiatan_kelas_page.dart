import 'package:flutter/material.dart';
import 'package:homy_school/theme.dart';
import 'package:homy_school/views/admin/kegiatan_kelas/detail_kegiatan_page.dart';
import 'package:homy_school/view_model.dart/class_activities_view_model.dart';
import 'package:homy_school/widgets/button.dart';
import 'package:provider/provider.dart';
import 'add_kegiatan_page.dart';

class KegiatanKelasPage extends StatelessWidget {
  const KegiatanKelasPage({super.key});

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
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: lavenderColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Kegiatan Kelas'.toUpperCase(),
          style: poppinsTextStyle.copyWith(
              fontSize: 25, color: lavenderColor, fontWeight: FontWeight.bold),
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
                style: poppinsTextStyle.copyWith(color: lavenderColor),
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Color(0XFF934bf8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Color(0XFF934bf8), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Color(0XFF934bf8), width: 1),
                    )),
                onChanged: (val) {
                  value.changeNameClassActivities(val);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Button(
                  nameButton: '+ Kegiatan',
                  widthButton: 220,
                  buttonFunction: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddKegiatanPage(),
                      ),
                    );
                  }),
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
                                  onLongPress: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Hapus Kegiatan'),
                                          content: const Text(
                                              'Hapus Kegiatan namaKegiatan?'),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          actionsAlignment:
                                              MainAxisAlignment.center,
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      lavenderColor),
                                              child: const Text('Batal'),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                value.deleteData(snapshot
                                                    .data!.docs[index].id);
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      lavenderColor),
                                              child: const Text('Hapus'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailKegiatanPage(
                                                idDoc: snapshot
                                                    .data!.docs[index].id),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 25),
                                    margin: const EdgeInsets.only(top: 15),
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          lavenderColor,
                                          Colors.blue,
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "${(snapshot.data!.docs[index].data() as Map<String, dynamic>)['name']}",
                                            overflow: TextOverflow.ellipsis,
                                            style: poppinsTextStyle.copyWith(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Divider(
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "${(snapshot.data!.docs[index].data() as Map<String, dynamic>)['description']}",
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
                                  onLongPress: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Hapus Kegiatan'),
                                          content: const Text(
                                              'Hapus Kegiatan namaKegiatan?'),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          actionsAlignment:
                                              MainAxisAlignment.center,
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      lavenderColor),
                                              child: const Text('Batal'),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                value.deleteData(snapshot
                                                    .data!.docs[index].id);
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      lavenderColor),
                                              child: const Text('Hapus'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  onTap: () async {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailKegiatanPage(
                                                idDoc: snapshot
                                                    .data!.docs[index].id),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 25),
                                    margin: const EdgeInsets.only(top: 15),
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          lavenderColor,
                                          Colors.blue,
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "${(snapshot.data!.docs[index].data() as Map<String, dynamic>)['name']}",
                                            overflow: TextOverflow.ellipsis,
                                            style: poppinsTextStyle.copyWith(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const Divider(
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "${(snapshot.data!.docs[index].data() as Map<String, dynamic>)['description']}",
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
