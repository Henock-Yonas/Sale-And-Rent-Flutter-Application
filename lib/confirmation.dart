import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:folisho/login.dart';
import 'package:folisho/theme.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              height: 50,
              child: RaisedButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                onPressed: () async {
                 
                },
                color: Colors.green,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Text(
                  "ለአገልግሎቱ በሚገባ ተመዝግበዋል!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
             
              padding:EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "አገልግሎቱ ተፈጻሚ የሚሆነው የማረጋገጫ መልዕክት (የስልክ ጥሪ) ሲደርሶ ስለሆነ መልዕክቱን በትዕግስት ይጠብቁ!",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

