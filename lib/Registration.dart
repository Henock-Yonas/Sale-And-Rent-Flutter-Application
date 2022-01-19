import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:folisho/confirmation.dart';
import 'package:folisho/theme.dart';
import 'package:intl/intl.dart';
import 'model/Registration_Model.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final RegistrationModel rentModel = RegistrationModel();
  final _FullNameController = TextEditingController();
  final _PhoneNumberController = TextEditingController();
  final _uidController = TextEditingController();
  final _indexController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "መረጃ መሙያ ቅጽ",
          style: TextStyle(
            color: Color(0xff5F6AC4),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
          child: Column(
            children: [
              TextField(
                controller: _indexController,
                decoration: InputDecoration(
                    hintText: "የቤቱ መለያ ቁጥር",
                    labelText: "የቤቱ መለያ ቁጥር",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder()),
                obscureText: false,
                onChanged: (value) => value = _indexController.text,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _FullNameController,
                decoration: InputDecoration(
                    hintText: "ስም",
                    labelText: "ስም",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder()),
                obscureText: false,
                onChanged: (value) => value = _FullNameController.text,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _PhoneNumberController,
                decoration: InputDecoration(
                    hintText: "ስልክ ቁጥር",
                    labelText: "ስልክ ቁጥር",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder()),
                obscureText: false,
                onChanged: (value) => value = _PhoneNumberController.text,
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 70,
                width: 100,
                child: RaisedButton(
                  onPressed: () {
                    postDetailsToFirestore();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConfirmPage()),
                    );
                  },
                  color: Colors.green,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    "submit",
                    style: TextStyle(color: whiteColor, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  postDetailsToFirestore() {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    RegistrationModel registrationModel = RegistrationModel();
    DocumentReference dr =
        FirebaseFirestore.instance.collection('registration').doc();
    // writing all the values
    // var dateFormat =
    //     DateFormat("dd-MM-yyyy"); // you can change the format here
    // // pass the UTC time here
    // var localDate = dateFormat.format(DateTime.now().toLocal()).toString();
    // String createdDate = dateFormat.format(DateTime.parse(localDate));
    // // DateTime now = DateTime.now();
    // // String formattedDate = DateFormat('yyyy-MM-dd – h:mma aa').format(now);
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formattedTime = DateFormat('kk:mm:a').format(now);
    String formattedDate = formatter.format(now);

    registrationModel.time = formattedTime;
    registrationModel.date = formattedDate;

    registrationModel.uid = dr.id;
    registrationModel.name = _FullNameController.text;
    registrationModel.phoneNumber = _PhoneNumberController.text;
    registrationModel.index = _indexController.text;

    firebaseFirestore
        .collection("Registration")
        .doc(registrationModel.uid)
        .set(registrationModel.toMap())
        .then((value) {});
    Fluttertoast.showToast(msg: "registered successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => ConfirmPage()),
        (route) => false);
  }
}
