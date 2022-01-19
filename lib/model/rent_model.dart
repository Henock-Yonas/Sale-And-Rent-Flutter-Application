import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class RentModel {
  String? uid;
  String? id;
  String? kindofhome;
  String? address;
  String? name;
  String? phoneNumber;
  String? image;
  String? detailImage;
  String? detailImage2;
  String? detailImage3;
  String? explanation;
  String? price;

  RentModel(
      {this.uid,
      this.kindofhome,
      this.id,
      this.address,
      this.name,
      this.phoneNumber,
      this.image,
      this.detailImage,
      this.detailImage2,
      this.detailImage3,
      this.explanation,
      this.price});

  // receiving data from server
  factory RentModel.fromMap(map) {
    return RentModel(
      uid: map['uid'],
      id: map['id'],
      kindofhome: map['kindofhome'],
      address: map['address'],
      name: map['name'],
      phoneNumber: map['phonenumber'],
      image: map['image'],
      detailImage: map['detailImage'],
      detailImage2: map['detailImage2'],
      detailImage3: map['detailImage3'],
      explanation: map['explanation'],
      price: map['price'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'id': id,
      'kindofhome': kindofhome,
      'address': address,
      'name': name,
      'phoneNumber': phoneNumber,
      'image': image,
      'detailImage': detailImage,
      'detailImage2': detailImage2,
      'detailImage3': detailImage3,
      'explanation': explanation,
      'price': price,
    };
  }
}
