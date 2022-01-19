import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:folisho/login.dart';
import 'package:folisho/theme.dart';

class RentReadS extends StatelessWidget {
  RentReadS({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('rent').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        height: 250,
        padding: const EdgeInsets.symmetric(vertical: 20),
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

              return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return Text("the address is ${data.docs[index]['address']})");
                },
              );
            }),
      ),
    );
  }
}
