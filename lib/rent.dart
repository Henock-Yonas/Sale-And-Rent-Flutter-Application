import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:folisho/SerachRent.dart';
import 'package:folisho/model/rent_model.dart';
import 'package:folisho/rent_detail.dart';
import 'package:folisho/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Rent extends StatelessWidget {
  Rent({Key? key, this.usermap}) : super(key: key);

  QuerySnapshot<Map<String, dynamic>>? usermap;
  Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('rent').snapshots();
  int? index;

  bool isloading = true;
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    onsearch() {
      FirebaseFirestore _firestore = FirebaseFirestore.instance;

      _firestore
          .collection('rent')
          .where('address', isEqualTo: _search.text)
          .get()
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => SearchRent(value)));
      });
    }

    return StreamBuilder<QuerySnapshot>(
        stream: users,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return Scaffold(
              backgroundColor: whiteColor,
              body: Text('Connection lost',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            );
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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: whiteColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Find your dream home",
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 19,
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8),
                              child: MaterialButton(
                                onPressed: () {
                                  onsearch();
                                },
                                color: purpleColor,
                                minWidth: 39,
                                height: 39,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: whiteColor,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          controller: _search,
                        ),
                      ),
                    ),
                    // NOTE: slider
                    Container(
                      height: 216,
                      child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                  child: SliderCard(
                                    //SizedBox(width: 30)
                                    imageUrl: "${data.docs[index]['image']}",
                                    title: "${data.docs[index]['kindofhome']}",
                                    city: "${data.docs[index]['address']}",
                                    id: index,
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
                      padding: EdgeInsets.only(left: 30, top: 30, bottom: 12),
                      child: Text(
                        "Recommended For You",
                        style: secondaryTitle,
                      ),
                    ),
                    RecommendCard(
                      imageUrl: "${data.docs[0]['image']}",
                      title: "${data.docs[0]['kindofhome']}",
                      city: "${data.docs[0]['address']}",
                      id: 0,
                    ),
                    SizedBox(height: 16),
                    RecommendCard(
                      imageUrl: "${data.docs[1]['image']}",
                      title: "${data.docs[1]['kindofhome']}",
                      city: "${data.docs[1]['address']}",
                      id: 1,
                    ),
                    SizedBox(height: 16),
                    RecommendCard(
                      imageUrl: "${data.docs[2]['image']}",
                      title: "${data.docs[2]['kindofhome']}",
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

// Slider card
class SliderCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String city;
  int id;
  SliderCard({
    required this.imageUrl,
    required this.title,
    required this.city,
    required this.id,
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
        elevation: 20,
        borderRadius: BorderRadius.circular(14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Container(
            height: 200,
            width: 200,
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInImage(
                  placeholder: AssetImage('assets/house-for-rent.png'),
                  image: NetworkImage(imageUrl),
                  width: 231,
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
