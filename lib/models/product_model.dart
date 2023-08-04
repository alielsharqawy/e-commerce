import 'dart:convert';

class ProductModel {
  String image;
  String productName;
  num price;
  ProductModel({
    required this.image,
    required this.productName,
    required this.price,
  });

  ProductModel copyWith({
    String? image,
    String? productName,
    num? price,
  }) {
    return ProductModel(
      image: image ?? this.image,
      productName: productName ?? this.productName,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'productName': productName,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      image: map['image'] as String,
      productName: map['productName'] as String,
      price: map['price'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductModel(image: $image, productName: $productName, price: $price)';

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.image == image &&
        other.productName == productName &&
        other.price == price;
  }

  @override
  int get hashCode => image.hashCode ^ productName.hashCode ^ price.hashCode;
}
