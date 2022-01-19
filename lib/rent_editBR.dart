// //import 'dart:html';
// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import 'package:folisho/theme.dart';
// import 'package:folisho/model/rent_model.dart';
// import 'package:path/path.dart';

// import 'package:provider/provider.dart';

// class RentEditBR extends StatefulWidget {
//   String x;

//   RentEditBR({required this.x});

//   get userId => null;

//   @override
//   _RentAddLSState createState() => _RentAddLSState();
// }

// class _RentAddLSState extends State< RentEditBR> {

//   final RentModel rentModel = RentModel();
//   final kindofController = TextEditingController();
//   final addressController = TextEditingController();
//   final nameController = TextEditingController();
//   final phonenumberController = TextEditingController();
//   final explanationController = TextEditingController();
//   final priceController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColor,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: Text(
//           "መረጃ መሙያ",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(30),
//           child: Column(
//             children: [
//               TextField(
//                 textDirection: TextDirection.ltr,
//                 decoration: InputDecoration(
//                     hintText: "የቤቱ አይነት",
//                     labelText: "የቤቱ አይነት",
//                     labelStyle: TextStyle(fontSize: 12, color: Colors.black),
//                     border: OutlineInputBorder()),
//                 obscureText: false,
//                 onChanged: (value) => value = kindofController.text,
//                 controller: kindofController,
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 textDirection: TextDirection.ltr,
//                 decoration: InputDecoration(
//                     hintText: "አድራሻ",
//                     labelText: "አድራሻ",
//                     labelStyle: TextStyle(fontSize: 12, color: Colors.black),
//                     border: OutlineInputBorder()),
//                 obscureText: false,
//                 onChanged: (value) => value = addressController.text,
//                 controller: addressController,
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 textDirection: TextDirection.ltr,
//                 decoration: InputDecoration(
//                     hintText: "የደላላው ስም",
//                     labelText: "የደላላው ስም",
//                     labelStyle: TextStyle(fontSize: 12, color: Colors.black),
//                     border: OutlineInputBorder()),
//                 obscureText: false,
//                 onChanged: (value) => value = nameController.text,
//                 controller: nameController,
//               ),
//               // ignore: prefer_const_constructors
//               SizedBox(height: 20),
//               TextField(
//                 textDirection: TextDirection.ltr,
//                 decoration: InputDecoration(
//                     hintText: "የደላላው ስልክ",
//                     labelText: "የደላላው ስልክ",
//                     labelStyle: TextStyle(fontSize: 12, color: Colors.black),
//                     border: OutlineInputBorder()),
//                 obscureText: false,
//                 onChanged: (value) => value = phonenumberController.text,
//                 controller: phonenumberController,
//               ),
//               SizedBox(height: 20),

//               RaisedButton(
//                 onPressed: () {
//                   imagePickerMethod();
//                 },
//                 color: purpleColor,
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(30))),
//                 child: Text(
//                   "የቤቱ ገጽታ ፎቶ ያስገቡ",
//                   style: TextStyle(color: whiteColor),
//                 ),
//               ),
//               SizedBox(height: 20),
//               RaisedButton(
//                 onPressed: () {},
//                 color: purpleColor,
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(30))),
//                 child: Text(
//                   "የቤቱ ገጽታ በዝርዝር ፎቶ ያስገቡ",
//                   style: TextStyle(color: whiteColor),
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 textDirection: TextDirection.ltr,
//                 decoration: InputDecoration(
//                     hintText: "ማብራሪያ",
//                     labelText: "ማብራሪያ",
//                     labelStyle: TextStyle(fontSize: 12, color: Colors.black),
//                     border: OutlineInputBorder()),
//                 obscureText: false,
//                 onChanged: (value) => value = explanationController.text,
//                 controller: explanationController,
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 textDirection: TextDirection.ltr,
//                 decoration: InputDecoration(
//                     hintText: "ዋጋ",
//                     labelText: "ዋጋ",
//                     labelStyle: TextStyle(fontSize: 12, color: Colors.black),
//                     border: OutlineInputBorder()),
//                 obscureText: false,
//                 onChanged: (value) => value = priceController.text,
//                 controller: priceController,
//               ),
//               SizedBox(height: 20),
//               RaisedButton(
//                 onPressed: () {
//                   postDetailsToFirestore(_image!);

//                   Navigator.of(context).pop();
//                 },
//                 color: Colors.green,
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(30))),
//                 child: Text(
//                   "submit",
//                   style: TextStyle(color: whiteColor),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   File? _image;
//   final imagePicker = ImagePicker();
//   String? userId;

//   Future imagePickerMethod() async {
//     final pick = await imagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pick != null) {
//         _image=File(pick.path);
//       } else {
//         showSnackBar("No File selected", Duration(milliseconds: 400));
//       }
//     });
//   }

//   // Future uploadImage(File _image) async {
//   //   final imgId = DateTime.now().millisecondsSinceEpoch.toString();
//   //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   //   Reference reference = FirebaseStorage.instance
//   //       .ref()
//   //       .child('${widget.userId}/images')
//   //       .child("post_$imgId");

//   //   await reference.putFile(_image);
//   //   var downloadURL = await reference.getDownloadURL();
//   //   rentModel.image = downloadURL;
//   //   // cloud firestore
//   // }

//   showSnackBar(String snackText, Duration d) {
//     final snackBar = SnackBar(content: Text(snackText), duration: d);
//     //ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

// //  showSnackBar(String snackText, Duration d) {
// //     final snackBar = SnackBar(content: Text(snackText), duration: d);
// //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
// //   }

//   postDetailsToFirestore(File _image) async {
//     // calling our firestore
//     // calling our user model
//     // sedning these values
//     final imgId = DateTime.now().millisecondsSinceEpoch.toString();
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     Reference reference = FirebaseStorage.instance
//         .ref()
//         .child('${widget.userId}/images')
//         .child("post_$imgId");

//     await reference.putFile(_image);
//     var downloadURL = await reference.getDownloadURL();

//     RentModel rentModel = RentModel();
//     DocumentReference dr = FirebaseFirestore.instance
//         .collection('rent')
//         .doc(); // writing all the values
//     rentModel.image = downloadURL;
//     rentModel.kindofhome = kindofController.text;
//     rentModel.address = addressController.text;
//     rentModel.name = nameController.text;
//     rentModel.phoneNumber = phonenumberController.text;
//     rentModel.explanation = explanationController.text;
//     rentModel.price = priceController.text;
//     rentModel.uid = userId;
//     firebaseFirestore
//         .collection("rent")
//         .doc(widget.x)
//         .update(rentModel.toMap())
//         .then((value) {});

//     Fluttertoast.showToast(msg: widget.x);
//   }
// }

//import 'dart:html';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:folisho/model/sale_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:folisho/theme.dart';
import 'package:folisho/model/rent_model.dart';
import 'package:path/path.dart';

import 'package:provider/provider.dart';

class RentEditBR extends StatefulWidget {
  String x;

  RentEditBR({required this.x});

  get userId => null;

  @override
  _SaleEditState createState() => _SaleEditState();
}

class _SaleEditState extends State<RentEditBR> {
  final RentModel rentModel = RentModel();
  final kindofController = TextEditingController();
  final IDController = TextEditingController();
  final addressController = TextEditingController();
  final nameController = TextEditingController();
  final phonenumberController = TextEditingController();
  final explanationController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "መረጃ መሙያ",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              TextFormField(
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                    hintText: "የቤቱ አይነት",
                    labelText: "የቤቱ አይነት",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder()),
                obscureText: false,
                onSaved: (value) => value = kindofController.text,
                controller: kindofController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("price cannot be Empty");
                  }
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                    hintText: "መለያ ቁጥር",
                    labelText: "መለያ ቁጥር",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder()),
                obscureText: false,
                onSaved: (value) => value = IDController.text,
                controller: IDController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("price cannot be Empty");
                  }
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                    hintText: "አድራሻ",
                    labelText: "አድራሻ",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder()),
                obscureText: false,
                onSaved: (value) => value = addressController.text,
                controller: addressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("price cannot be Empty");
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                    hintText: "የደላላው ስም",
                    labelText: "የደላላው ስም",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder()),
                obscureText: false,
                onSaved: (value) => value = nameController.text,
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("price cannot be Empty");
                  }
                },
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              TextFormField(
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                    hintText: "የደላላው ስልክ",
                    labelText: "የደላላው ስልክ",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder()),
                obscureText: false,
                onSaved: (value) => value = phonenumberController.text,
                controller: phonenumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("price cannot be Empty");
                  }
                },
              ),
              SizedBox(height: 20),

              RaisedButton(
                onPressed: () {
                  imagePickerMethod();
                },
                color: purpleColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "የቤቱ ገጽታ ፎቶ ያስገቡ",
                  style: TextStyle(color: whiteColor),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  image1PickerMethod();
                },
                color: purpleColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "1 የቤቱ ገጽታ በዝርዝር ፎቶ ያስገቡ",
                  style: TextStyle(color: whiteColor),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  image2PickerMethod();
                },
                color: purpleColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "2 የቤቱ ገጽታ በዝርዝር ፎቶ ያስገቡ",
                  style: TextStyle(color: whiteColor),
                ),
              ),

              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  image3PickerMethod();
                },
                color: purpleColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "3 የቤቱ ገጽታ በዝርዝር ፎቶ ያስገቡ",
                  style: TextStyle(color: whiteColor),
                ),
              ),

              SizedBox(height: 20),
              TextFormField(
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                    hintText: "ማብራሪያ",
                    labelText: "ማብራሪያ",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder()),
                obscureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("price cannot be Empty");
                  }
                },
                onSaved: (value) => value = explanationController.text,
                controller: explanationController,
              ),
              SizedBox(height: 20),
              TextFormField(
                textDirection: TextDirection.ltr,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("price cannot be Empty");
                  }
                },
                decoration: InputDecoration(
                    hintText: "ዋጋ",
                    labelText: "ዋጋ",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                    border: OutlineInputBorder()),
                obscureText: false,
                onSaved: (value) => value = priceController.text,
                controller: priceController,
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  postDetailsToFirestore(
                    _image!,
                    image!,
                    image2!,
                    image3!,
                  );

                  Navigator.of(context).pop();
                },
                color: Colors.green,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text(
                  "submit",
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  File? _image;
  File? image;
  File? image2;
  File? image3;
  final imagePicker = ImagePicker();
  String? userId;
  // List<File> image = [];

  Future imagePickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar("No File selected", Duration(milliseconds: 400));
      }
    });
  }

  Future image1PickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        image = File(pick.path);
      } else {
        showSnackBar("No File selected", Duration(milliseconds: 400));
      }
    });
  }

  Future image2PickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        image2 = File(pick.path);
      } else {
        showSnackBar("No File selected", Duration(milliseconds: 400));
      }
    });
  }

  Future image3PickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        image3 = File(pick.path);
      } else {
        showSnackBar("No File selected", Duration(milliseconds: 400));
      }
    });
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    //ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

//  showSnackBar(String snackText, Duration d) {
//     final snackBar = SnackBar(content: Text(snackText), duration: d);
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

  postDetailsToFirestore(
      File _image, File image, File image2, File image3) async {
    // calling our firestore
    // calling our user model
    // sedning these values
    final imgId = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('${widget.userId}/images')
        .child("post_$imgId");

    await reference.putFile(_image);
    var downloadURL = await reference.getDownloadURL();

    final imgId1 = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference1 = FirebaseStorage.instance
        .ref()
        .child('${widget.userId}/images')
        .child("post_$imgId1");

    await reference1.putFile(image);
    var downloadURL1 = await reference1.getDownloadURL();

    final imgId2 = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference2 = FirebaseStorage.instance
        .ref()
        .child('${widget.userId}/images')
        .child("post_$imgId2");

    await reference2.putFile(image2);
    var downloadURL2 = await reference2.getDownloadURL();

    final imgId3 = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference3 = FirebaseStorage.instance
        .ref()
        .child('${widget.userId}/images')
        .child("post_$imgId3");

    await reference3.putFile(image3);
    var downloadURL3 = await reference3.getDownloadURL();

    final RentModel rentModel = RentModel();
    DocumentReference dr = FirebaseFirestore.instance
        .collection('sale')
        .doc(); // writing all the values

    rentModel.kindofhome = kindofController.text;
    rentModel.address = addressController.text;
    rentModel.id = IDController.text;
    rentModel.name = nameController.text;
    rentModel.phoneNumber = phonenumberController.text;
    rentModel.image = downloadURL;
    rentModel.detailImage = downloadURL1;
    rentModel.detailImage2 = downloadURL2;
    rentModel.detailImage3 = downloadURL3;
    rentModel.explanation = explanationController.text;
    rentModel.price = priceController.text;
    rentModel.uid = dr.id;
    firebaseFirestore
        .collection("rent")
        .doc(widget.x)
        .update(rentModel.toMap())
        .then((value) {});

    Fluttertoast.showToast(msg: 'Edited succesfully');
  }
}
