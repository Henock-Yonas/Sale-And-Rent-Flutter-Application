import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:folisho/main.dart';
import 'package:folisho/rent_detail.dart';
import 'package:folisho/sale_detail.dart';
import 'package:folisho/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import 'SearchRentDetail.dart';

class TotalRent extends StatelessWidget {
  TotalRent({Key? key}) : super(key: key);
  static const String _title = 'አጠቃላይ';
  Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('Registration').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(_title),
          centerTitle: true,
          backgroundColor: Colors.deepPurple),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: StreamBuilder<QuerySnapshot>(
                stream: users,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Text('something is wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('loading');
                  }

                  final data = snapshot.requireData;

                  int x = 1;
                  return DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'ተ.ቁ',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ስም',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ስልክ ቁጥር ',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'የተመዘገበበት ቀን ',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'የተመዘገበበት ሰዐት ',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'መለያ ቁጥር ',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ሁኔታ',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      data.size,
                      (index) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(index.toString())),
                          DataCell(
                            Text("${data.docs[index]['name']}"),
                          ),
                          DataCell(
                            Text("${data.docs[index]['phoneNumber']}"),
                            onTap: () {
                              customLaunch(
                                  'tel:${data.docs[index]['phoneNumber']}');
                            },
                          ),
                          DataCell(Text("${data.docs[index]['date']}")),
                          DataCell(Text("${data.docs[index]['time']}")),
                          DataCell(
                            Text("${data.docs[index]['index']}"),
                            onTap: () {
                              FirebaseFirestore _firestore =
                                  FirebaseFirestore.instance;
                              _firestore
                                  .collection('rent')
                                  .where('id',
                                      isEqualTo: "${data.docs[index]['index']}")
                                  .get()
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            SearchRentDetail(value)));
                              });
                            },
                          ),
                          DataCell(
                            IconButton(
                                onPressed: () {
                                  delete("${data.docs[index]['uid']}");
                                },
                                icon: Icon(Icons.delete)),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  delete(String uid) async {
    // calling our firestore
    // calling our user model
    // sedning these values

    await FirebaseFirestore.instance
        .collection("Registration")
        .doc(uid)
        .delete();
    Fluttertoast.showToast(msg: 'deleted succesfully');
  }
}
