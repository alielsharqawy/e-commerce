import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesModel {
  String? name;
  String? uId;
  String? image;

  CategoriesModel({
    this.name,
    this.uId,
    this.image,
  });
  CategoriesModel.fromJason(Map<String, dynamic> json) {
    name = json['name'];
    uId = json['uId'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
    };
  }

  factory CategoriesModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return CategoriesModel(
      image: data['image'],
      name: data['name'],
      uId: data['uId'],
    );
  }
}
