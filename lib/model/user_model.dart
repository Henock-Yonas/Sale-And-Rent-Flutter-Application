class UserModel {
  String? uid;
  String? email;
  String? userName;
  String? rentid;

  UserModel({this.uid, this.email, this.userName,this.rentid});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      userName: map['userName'],
      rentid:map['rentid']
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'userName': userName,
      'rentid':rentid
    };
  }
}
