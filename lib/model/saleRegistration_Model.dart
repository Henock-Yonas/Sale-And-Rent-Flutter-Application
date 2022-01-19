import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class saleRegistrationModel {
  String? uid;
  String? name;
  String? phoneNumber;
  String? index;
  String? time;
  String? date;
  

  saleRegistrationModel( {this.uid,
      this.name,
      this.phoneNumber,
      this.index,
      this.time,
      this.date});


  // receiving data from server
  factory saleRegistrationModel.fromMap(map) {

    return saleRegistrationModel(
        uid: map['uid'],
        name: map['name'],
        phoneNumber: map['phonenumber'],
        index: map['index'],
        time: map['time'],
        date: map['date']);
    
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'index': index,
      'time': time,
      'date':date,
    
    };
  }
}
