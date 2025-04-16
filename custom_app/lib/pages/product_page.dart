import 'package:flutter/material.dart';
import 'package:custom_app/models/product_model.dart';
import 'package:custom_app/pages/home_page.dart';
import 'package:custom_app/widgets/expand_description.dart';
import 'package:custom_app/globals.dart' as globals;


class ProductPage extends StatefulWidget{
  final Product product;
  ProductPage({required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>{
  bool isFavorite = false;

  void checkFavorite(Product product){
    setState(() {
      if(globals.favoriteProducts.contains(product))
        isFavorite = true;
    });
  }
  void toggleFavorite(Product product){
    setState(() {
      if(globals.favoriteProducts.contains(product))
        {
          globals.favoriteProducts.remove(product);
        }
      else 
        {
          if (!globals.favoriteProducts.contains(product))
            globals.favoriteProducts.add(product);
        }
    });
  }

  @override
  Widget build(BuildContext context){
     return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding (
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
                  onPressed: () => { 
                    toggleFavorite(widget.product)
                  }, 
                  icon: Icon(
                    size: 40, 
                    // Icons.favorite_border,
                    // color: Colors.black,
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.deepPurple : Colors.black,
                    ), )
              ],
            ),
            Center(
              child: Image.network(
                widget.product.productImage,
                height: 400,
                width: 400,
              ),
            ),
            SizedBox(height:24),
            Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
              widget.product.productName.split(' ').take(4).join(' '),
              style: TextStyle(fontSize: 20, fontWeight:  FontWeight.bold),

            ),
            Text('\$${widget.product.productPrice}', 
            style: TextStyle(fontSize: 20), 
            ),
            ],
            ),
            Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            height: 2,
            color: Colors.grey[200],
            ),
            SizedBox(height:12),
            ExpandDescription(text: widget.product.productDescription),
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
                  '${widget.product.rating.rate} from ${widget.product.rating.count} Reviews', 
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