
class Product {
  final int id;
  final String productName;
  final String productDescription; 
  final double productPrice;
  final String productImage;


  Product({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'],
      productName: json['title'],
      productDescription: json['description'],
      productPrice: json['price'].toDouble(),
      productImage: json['image'],
    );
  }
}