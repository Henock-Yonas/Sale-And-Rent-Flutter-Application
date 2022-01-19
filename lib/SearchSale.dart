import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:folisho/SearchSaleDetail.dart';
import 'package:folisho/model/rent_model.dart';
import 'package:folisho/rent_detail.dart';
import 'package:folisho/sale_detail.dart';
import 'package:folisho/theme.dart';

class SearchSale extends StatefulWidget {
  QuerySnapshot<Map<String, dynamic>> usermap;

  SearchSale(this.usermap);

  @override
  _RentAddLSState createState() => _RentAddLSState();
}

class _RentAddLSState extends State<SearchSale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE: header
              Padding(
                padding: EdgeInsets.only(
                  left: 30.0,
                  top: 30.0,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/images/menu_icon.png",
                    width: 18,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 100.0, top: 10.0, bottom: 30),
                child: Text(
                  "Search Result",
                  style: primaryTitle,
                ),
              ),
              // NOTE: search

              // NOTE: slider
              Container(
                height: 216,
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.usermap.size,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: SliderCard(
                              //SizedBox(width: 30)
                              imageUrl:
                                  "${widget.usermap.docs[index]['image']}",
                              title:
                                  "${widget.usermap.docs[index]['kindofhome']}",
                              city: "${widget.usermap.docs[index]['address']}",
                              id: index,
                              x: "${widget.usermap.docs[index]['uid']}",
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // NOTE: recommeded

              // Padding(
              //   padding: EdgeInsets.only(left: 30, top: 30, bottom: 12),
              //   child: Text(
              //     "Recommended For You",
              //     style: secondaryTitle,
              //   ),
              // ),
              // RecommendCard(
              //   imageUrl: "assets/images/house1.png",
              //   title: "የንግድ ቤት",
              //   city: "ሰፈረ ሠላም",
              //   id: 1,
              // ),
              // SizedBox(height: 16),
              // RecommendCard(
              //   imageUrl: "assets/images/house2.png",
              //   title: "ባለ 1 መኝታ",
              //   city: "01 ሞቢል",
              //   id: 1,
              // ),
              // SizedBox(height: 16),
              // RecommendCard(
              //   imageUrl: "assets/images/house3.png",
              //   title: "ሙሉ ጊቢ ለድርጅት",
              //   city: "አቶቴ",
              //   id: 1,
              // ),
              // SizedBox(
              //   height: 60,
              // ),
            ],
          ),
        ),
      ),
    );
  }
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
    onsearch() {
      FirebaseFirestore _firestore = FirebaseFirestore.instance;

      _firestore
          .collection('sale')
          .where('uid', isEqualTo: x)
          .get()
          .then((value) {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => SearchSaleDetail(value)));
      });
    }

    return InkWell(
      onTap: () {
        onsearch();
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
                Image.network(
                  imageUrl,
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

// // Recommend Card
// // class RecommendCard extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String city;
//   int id;

//   RecommendCard(
//       {required this.imageUrl,
//       required this.title,
//       required this.city,
//       required this.id});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 30),
//       child: Material(
//         elevation: 6,
//         shadowColor: shadowColor,
//         borderRadius: BorderRadius.circular(14),
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: 100,
//           padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(14),
//             color: whiteColor,
//           ),
//           child: Row(
//             children: [
//               Image.asset(
//                 imageUrl,
//                 width: 60,
//                 fit: BoxFit.fill,
//               ),
//               SizedBox(width: 8),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: contentTitle,
//                   ),
//                   SizedBox(
//                     height: 2,
//                   ),
//                   Text(
//                     city,
//                     style: infoText,
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                 ],
//               ),
//               Spacer(),
//               IconButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => SaleDetailPage(id)));
//                 },
//                 icon: Icon(
//                   Icons.arrow_forward_ios,
//                   color: blackColor,
//                   size: 14,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
