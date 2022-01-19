import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:folisho/Registration.dart';
import 'package:folisho/login.dart';
import 'package:folisho/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchRentDetail extends StatefulWidget {
  QuerySnapshot<Map<String, dynamic>> usermap;
  

  SearchRentDetail(this.usermap, {Key? key}) : super(key: key);
  Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('rent').snapshots();
  @override
  _RentAddLSState createState() => _RentAddLSState();
}

class _RentAddLSState extends State<SearchRentDetail> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('rent').snapshots(),
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

          final data = widget.usermap;
          return Scaffold(
            backgroundColor: whiteColor,
            body: SafeArea(
                child: Stack(children: [
              // NOTE: thumbnail image
              Container(
                width: 410,
                height: 400,
                child: Image.network(
                  "${data.docs[data.size - 1]['image']}",
                  height: 296,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              // NOTE: content
              ListView(
                children: [
                  SizedBox(
                    height: 266,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                      color: whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NOTE: title
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 24,
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data.docs[data.size - 1]['kindofhome']}",
                                    style: secondaryTitle,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${data.docs[data.size - 1]['address']}",
                                    style: infoSecondaryTitle,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [1].map((e) {
                                  return Text(
                                    "መለያ ቁጥር፦ " +  ("${data.docs[data.size - 1]['id']}"),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        // NOTE: agent
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "ይህንን መረጃ ለጣፊ",
                            style: sectionSecondaryTitle,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/delala.png",
                                width: 50,
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data.docs[data.size - 1]['name']}",
                                    style: contentTitle,
                                  ),
                                  Text(
                                    "ደላላ",
                                    style: infoText,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      customLaunch(
                                          'sms:${data.docs[data.size - 1]['phoneNumber']}');
                                    },
                                    child: Image.asset(
                                      "assets/images/message_icon.png",
                                      width: 30,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      customLaunch(
                                          'tel:${data.docs[data.size - 1]['phoneNumber']}');
                                    },
                                    child: Image.asset(
                                      "assets/images/call_icon.png",
                                      width: 31,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        // NOTE: facilities
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 31),
                          child: Text(
                            "የቤቱ ገጽታዎች",
                            style: sectionSecondaryTitle,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 250,
                          padding: EdgeInsets.only(bottom: 5),
                          child: ListView(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(width: 30),
                              Card(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        "${data.docs[0]['detailImage']}",
                                        fit: BoxFit.fill,
                                        height: 150,
                                        width: 150,
                                      ),
                                      SizedBox(height: 10),
                                      Text("ፎቶ፦ 1")
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Card(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        "${data.docs[data.size - 1]['detailImage2']}",
                                        fit: BoxFit.fill,
                                        height: 150,
                                        width: 150,
                                      ),
                                      SizedBox(height: 10),
                                      Text("ፎቶ፦ 2")
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Card(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        "${data.docs[data.size - 1]['detailImage3']}",
                                        fit: BoxFit.fill,
                                        height: 150,
                                        width: 150,
                                      ),
                                      SizedBox(height: 10),
                                      Text("ፎቶ፦ 3")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // NOTE: description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "ማብራሪያ",
                      style: sectionSecondaryTitle,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "${data.docs[data.size - 1]['explanation']}",
                      style: descText,
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
              // NOTE: button back
              Positioned(
                top: 20,
                left: 20,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  minWidth: 30,
                  height: 30,
                  padding: EdgeInsets.all(5),
                  color: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 14,
                  ),
                ),
              ),
            ])),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 80,
              color: whiteColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ኪራይ በወር",
                        style: priceTitle,
                      ),
                      Text(
                        "${data.docs[data.size - 1]['price']}",
                        style: priceText,
                      ),
                    ],
                  ),
                  Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    color: purpleColor,
                    minWidth: 196,
                    height: 50,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Text(
                      "አሁን ይከራዩ",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

// Facilities Card
class FacilityCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  FacilityCard({
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: shadowColor,
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 100,
          height: 110,
          color: whiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(imageUrl),
              SizedBox(height: 9),
              Center(
                child: Text(
                  title,
                  style: facilitiesTitle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
