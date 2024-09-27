import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String name;
  final String description;
  final String category;
  final String? id;
  final double quantity;
  final double price;
  final List<String> images;
  Product({
    required this.name,
    required this.description,
    required this.category,
    this.id,
    required this.quantity,
    required this.price,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'category': category,
      'id': id,
      'quantity': quantity,
      'price': price,
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      id: map['_id'] != null ? map['_id'] as String : null,
      quantity: map['quantity'] as double,
      price: map['price'] as double,
      images: List<String>.from((map['images'] as List<String>),
    )
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
