import 'package:flutter/material.dart';
import 'package:custom_app/models/product_model.dart';
import 'package:custom_app/pages/home_page.dart';


class ProductPage extends StatelessWidget{
  final Product product;

  ProductPage({required this.product});

  @override
  Widget build(BuildContext context){
     return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Padding (
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                 onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()))
                 },
                 icon: Icon(Icons.arrow_back_ios_outlined, size:40),),
                IconButton(
                  onPressed: () => {}, 
                  icon: Icon(
                    size: 40, 
                    Icons.favorite_border,
                    color: Colors.black,
                    //widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                    //color: widget.isFavorite ? Colors.deepPurple : Colors.black,
                    ), )
              ],
            ),
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
            Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 2,
            color: Colors.grey[200],
            ),
            Text('\$${product.productPrice}', 
            style: TextStyle(fontSize: 20), 
            ),
            SizedBox(height:12),
            Text(
              product.productDescription,
              style: TextStyle(fontSize: 16),
            ),
             Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 2,
            color: Colors.grey[200],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rating',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${product.rating.rate} from ${product.rating.count} Reviews', 
                  style: TextStyle(
                    color: Colors.orange, 
                    fontSize: 18,
                  ),
                  ),
              ],
            ),
            Spacer(),
            SizedBox(
            width: 1000,
            height: 55,
            child: ElevatedButton(
             onPressed: () => {debugPrint("Simulating cart")},
             style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
             ),
             child: Text(
                'ADD TO CART',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'TimesNewRoman',
                ),
             ),
             ),
            ),
          ]
            ),
          
          ),
        ),
     );
  }

}