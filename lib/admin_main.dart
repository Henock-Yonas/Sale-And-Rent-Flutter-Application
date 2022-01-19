import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:folisho/complete_rent.dart';
import 'package:folisho/complete_sale.dart';
import 'package:folisho/loading_sale.dart';
import 'package:folisho/rent_dashboard.dart';
import 'package:folisho/sale_dashboard.dart';
import 'package:folisho/sale_detail.dart';
import 'package:folisho/theme.dart';
import 'package:folisho/total_rent.dart';
import 'package:folisho/total_sale.dart';

import 'loading_rent.dart';

class AdminMain extends StatelessWidget {
  const AdminMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(indicatorColor: Theme.of(context).primaryColor, tabs: [
            Image.asset(
              "assets/data_add..png",
              width: 40,
              height: 40,
            ),
            Image.asset(
              "assets/status-icon.png",
              width: 40,
              height: 40,
            ),
          ]),
          backgroundColor: whiteColor,
          title: const Text(
            "የደላላ ገጽ",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: TabBarView(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 70),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (content) =>
                                                const RentDashboard()));
                                  },
                                  child: Image.asset(
                                    "assets/house-for-rent.png",
                                    height: 150,
                                    scale: 7,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (content) =>
                                                const SaleDashboard()));
                                  },
                                  child: Image.asset(
                                    "assets/houseforsale.png",
                                    height: 150,
                                    scale: 6,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                padding: const EdgeInsets.only(top: 40),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    Card(
                      child: Image.asset(
                        "assets/house-for-rent.png",
                        scale: 8,
                      ),
                      elevation: 2,
                      margin: const EdgeInsets.all(10),
                    ),
                    Card(
                      child: Image.asset(
                        "assets/houseforsale.png",
                        scale: 7,
                      ),
                      elevation: 2,
                      margin: const EdgeInsets.all(10),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (content) => TotalRent()));
                              },
                              child: Image.asset(
                                "assets/complete.png",
                                scale: 3,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "የኪራይ ተመዝጋቢዎች",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      elevation: 8,
                      margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (content) => TotalSale()));
                              },
                              child: Image.asset(
                                "assets/complete.png",
                                scale: 3,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "የግዢ ተመዝጋቢዎች",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      elevation: 8,
                      margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
