// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String image;
  String name;
 
  ProductModel({
    required this.image,
    required this.name,
  });

  ProductModel copyWith({
    String? image,
    String? name,
  }) {
    return ProductModel(
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'name': name,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      image: map['image'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductModel(image: $image, name: $name)';

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.image == image &&
      other.name == name;
  }
   factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ProductModel(
      image: data['image'],
      name: data['name'],
      
    );
  }

  @override
  int get hashCode => image.hashCode ^ name.hashCode;
}
