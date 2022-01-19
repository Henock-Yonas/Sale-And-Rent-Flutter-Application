


// import 'package:flutter/material.dart';
// import 'package:folisho/Services/firestore_service.dart';
// import 'package:folisho/model/rent_model.dart';
// import 'package:uuid/uuid.dart';

// class RentProvider with ChangeNotifier {
//   final firestoreService = FirestoreService();
//    String? _uid;
//    String? _kindofhome;
//    String? _address;
//    String? _name;
//    String? _phoneNumber;
//    Image? _image;
//    Image? _detailImage;
//    String? _explanation;
//    String? _price;
//   var uuid = Uuid();

//   //Getters
//   String? get uid => _uid;
//   String? get kindofhome => _kindofhome;
//   String? get address => _address;
//   String? get name => _name;
//   String? get phomenumber => _phoneNumber;
//   Image? get image => _image;
//   Image? get detailImage => _detailImage;
//   String? get explanation => _explanation;
//   Stream<List<RentModel>> get entries => firestoreService.getEntries();

//   //Setters
//   set changekindofhome(String kindofhome) {
//     _kindofhome = kindofhome;
//     notifyListeners();
//   }

//   set changeaddress(String address) {
//     _address = address;
//     notifyListeners();
//   }

//   set changename(String name) {
//     _name = name;
//     notifyListeners();
//   }

//   set changephonenumber(String phonenumber) {
//     _phoneNumber = phonenumber;
//     notifyListeners();
//   }

//   set changeimage(Image image) {
//     _image = image;
//     notifyListeners();
//   }

//   set changedetailImage(Image detailImage) {
//     _detailImage = detailImage;
//     notifyListeners();
//   }

//   set changeexplanation(String explanation) {
//     _explanation = explanation;
//     notifyListeners();
//   }

//   set changeprice(String price) {
//     _price = price;
//     notifyListeners();
//   }

//   loadAll(RentModel rentModel) {
//     if (rentModel != null) {
//       _kindofhome = rentModel.kindofhome;
//       _address = rentModel.address;
//       _name = rentModel.name;
//       _phoneNumber = rentModel.phoneNumber;
//       _image = rentModel.image;
//       _detailImage = rentModel.detailImage;
//       _explanation = rentModel.explanation;
//       _price = rentModel.price;
//     } else {
//       _kindofhome =null;
//       _address = null;
//       _name = null;
//       _phoneNumber= null;
//       _image = null;
//       _detailImage = null;
//       _explanation = null;
//       _price = null;
//     }
//   }

//   saverent(){
//     if (_uid == null){
//       //Add
//       var newEntry = RentModel(kindofhome: _kindofhome, address: _address,name:_name ,phoneNumber:_phoneNumber,image:_image,detailImage:_detailImage,explanation:_explanation,price:_price,uid: uuid.v1());
//       print(newEntry);
//       firestoreService.setEntry(newEntry);
//     } else {
//       //Edit
//       var updatedEntry = RentModel(kindofhome: _kindofhome, address: _address,name:_name ,phoneNumber:_phoneNumber,image:_image,detailImage:_detailImage,explanation:_explanation,price:_price, uid: _uid);
//       firestoreService.setEntry(updatedEntry);
//     }
//   }
//   removeEntry(String uid){
//     firestoreService.removeEntry(uid);
//   }
// }
