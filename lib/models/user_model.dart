import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? password;
  String? uId;
  UserModel({this.email, this.uId, this.password});
  UserModel.fromJason(Map<String, dynamic> json) {
    email = json['email'];
    uId = json['uId'];
    password = json['password'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uId': uId,
      'password': password,
    };
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return UserModel(
      email: data['email'],
      uId: data['uId'],
      password: data['password'],
    );
  }
}
