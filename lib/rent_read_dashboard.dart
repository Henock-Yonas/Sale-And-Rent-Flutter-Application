import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:folisho/rent_detail.dart';
import 'package:folisho/rent_editBR.dart';
import 'package:folisho/theme.dart';

class RentReadDashboard extends StatelessWidget {
  RentReadDashboard({Key? key}) : super(key: key);
  Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('rent').snapshots();
  int? index;

//   void demo() async {
//   String myDocId = 'user.uid';
//   DocumentSnapshot documentSnapshot;

//   await FirebaseFirestore.instance
//       .collection('rent') // suppose you have a collection named "Users"
//       .doc(myDocId)
//       .get()
//       .then((value) {
//     documentSnapshot = value; // you get the document here
//   });

//   //now you can access the document field value
//   String name = documentSnapshot.toString();
//   var location = documentSnapshot['location'];
// }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: users,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return Text('something is wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: whiteColor,
              body: Text('loading',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            );
          }

          final data = snapshot.requireData;
          return Scaffold(
            backgroundColor: greyColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NOTE: header
                    Padding(
                      padding: EdgeInsets.only(left: 100.0, top: 30.0),
                      child: Text(
                        "የሚከራይ ቤት",
                        style: primaryTitle,
                      ),
                    ),
                    // NOTE: search
                    Container(
                      padding: EdgeInsets.all(30.0),
                      child: Material(
                        elevation: 6,
                        shadowColor: shadowColor,
                        borderRadius: BorderRadius.circular(28),
                        child: TextField(
                          decoration: searchDecoration,
                        ),
                      ),
                    ),
                    // NOTE: slider
                    Container(
                      height: 216,
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 50),
                        scrollDirection: Axis.horizontal,
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                  child: SliderCard(
                                    //SizedBox(width: 30)
                                    imageUrl: "${data.docs[index]['image']}",
                                    title: "${data.docs[index]['name']}",
                                    city: "${data.docs[index]['address']}",
                                    id: index,
                                    x: "${data.docs[index]['uid']}",
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    // NOTE: recommeded

                    Padding(
                      padding: EdgeInsets.only(left: 30, top: 50, bottom: 12),
                      child: Text(
                        "Recommended For You",
                        style: secondaryTitle,
                      ),
                    ),
                    RecommendCard(
                      imageUrl: "${data.docs[0]['image']}",
                      title: "${data.docs[0]['name']}",
                      city: "${data.docs[0]['address']}",
                      id: 0,
                    ),
                    SizedBox(height: 16),
                    RecommendCard(
                      imageUrl: "${data.docs[1]['image']}",
                      title: "${data.docs[1]['name']}",
                      city: "${data.docs[1]['address']}",
                      id: 1,
                    ),
                    SizedBox(height: 16),
                    RecommendCard(
                      imageUrl: "${data.docs[2]['image']}",
                      title: "${data.docs[2]['name']}",
                      city: "${data.docs[2]['address']}",
                      id: 2,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

delete(String uid) async {
  // calling our firestore
  // calling our user model
  // sedning these values

  await FirebaseFirestore.instance.collection("rent").doc(uid).delete();
  Fluttertoast.showToast(msg: uid);
}

// Slider card
class SliderCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String city;
  int id;
  String x;
  SliderCard({
    required this.imageUrl,
    required this.title,
    required this.city,
    required this.id,
    required this.x,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => DetailPage(id)));
      },
      child: Material(
        shadowColor: shadowColor,
        elevation: 5,
        borderRadius: BorderRadius.circular(14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            height: 250,
            width: 270,
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInImage(
                  placeholder: AssetImage('assets/house-for-rent.png'),
                  image: NetworkImage(imageUrl),
                  width: 270,
                  height: 150,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: contentTitle,
                          ),
                          Text(
                            city,
                            style: infoText,
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            delete(x);
                          },
                          icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RentEditBR(
                                          x: x,
                                        )));
                          },
                          icon: Icon(Icons.edit))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Recommend Card
class RecommendCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String city;
  int id;

  RecommendCard(
      {required this.imageUrl,
      required this.title,
      required this.city,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Material(
        elevation: 6,
        shadowColor: shadowColor,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: whiteColor,
          ),
          child: Row(
            children: [
              Image.network(
                imageUrl,
                width: 60,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: contentTitle,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    city,
                    style: infoText,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DetailPage(id)));
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: blackColor,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
