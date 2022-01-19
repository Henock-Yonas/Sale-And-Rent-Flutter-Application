

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:folisho/model/rent_model.dart';


// class FirestoreService {
//   FirebaseFirestore _db = FirebaseFirestore.instance;
  

//   //Get Entries
//     Stream<List<RentModel>> getEntries(){
//       return _db
//         .collection('rent')
//         .snapshots()
//         .map((snapshot) => snapshot.docs
//         .map((doc) => RentModel.fromJson(doc.data()))
//         .toList());
//     }
// //Upsert
//     Future<void> setEntry(RentModel RentModel){
//       var options = SetOptions(merge:true);

//       return _db
//         .collection('rent')
//         .doc(RentModel.uid)
//         .set(RentModel.toMap(),options).then((value) {});
        
        
//     }
// //Delete
//     Future<void> removeEntry(String uid){
//       return _db
//         .collection('rent')
//         .doc(uid)
//         .delete();
//     }



//   }