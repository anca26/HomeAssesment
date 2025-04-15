import 'package:flutter/material.dart';
import 'package:custom_app/models/product_model.dart';


class ProductPage extends StatelessWidget{
  final Product product;

  ProductPage({required this.product});

  @override
  Widget build(BuildContext context){
     return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Padding (
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.productImage,
                height: 400,
                width: 400,
              ),
            ),
            SizedBox(height:24),
            Text(
              product.productName,
              style: TextStyle(fontSize: 20, fontWeight:  FontWeight.bold),

            ),
            SizedBox(height:8),
            Text('\$${product.productPrice}', 
            style: TextStyle(fontSize: 20), 
            ),
            SizedBox(height:12),
            Text(
              product.productDescription,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rating',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${product.rating.rate} from ${product.rating.count} Reviews', 
                  style: TextStyle(
                    color: Colors.orange, 
                    fontSize: 16,
                  ),
                  ),
              ],
            ),
          ]
            ),
          ),
        ),
     );
  }

}