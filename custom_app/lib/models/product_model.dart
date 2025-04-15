
import 'package:custom_app/models/rating_model.dart';

class Product {
  final int id;
  final String productName;
  final String productDescription; 
  final double productPrice;
  final String productImage;
  final Rating rating;

  Product({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
    required this.rating
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'],
      productName: json['title'],
      productDescription: json['description'],
      productPrice: json['price'].toDouble(),
      productImage: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}