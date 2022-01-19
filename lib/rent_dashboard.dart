import 'package:flutter/material.dart';
import 'package:folisho/model/rent_model.dart';
import 'package:folisho/rent_addLS.dart';
import 'package:folisho/rent_detail.dart';
import 'package:folisho/rent_read_dashboard.dart';
import 'package:folisho/theme.dart';

class RentDashboard extends StatelessWidget {
  const RentDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: Container(
          padding: const EdgeInsets.only(top: 250),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: [
              Card(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (content) => RentReadDashboard()));
                  },
                  child: Image.asset(
                    "assets/read_data.png",
                    scale: 4,
                  ),
                ),
              ),
              Card(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (content) =>
                                RentAddLS(rentModel: RentModel())));
                  },
                  child: Image.asset(
                    "assets/add_data.jpg",
                    scale: 2,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
// Slider card

