import 'package:flutter/material.dart';
import 'package:custom_app/models/product_model.dart';

class ProductItem extends StatefulWidget{

  final Product product;
  ProductItem({required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>{
    bool isFavorite = false;
    //future function for adding to fav

    void toggleFavorite() {
      setState(() {
        isFavorite = !isFavorite;
      });
    }

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.network(
                    widget.product.productImage,
                    fit: BoxFit.contain, 
                    ),
                  ),
                ),
              SizedBox(height:12),
              Text(
                widget.product.productName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                 ),
              ),
              Text(
                '\$${widget.product.productPrice.toStringAsFixed(2)}'
              ),
            ],
           ),
          ),
          Positioned(
            top: 3,
            right: 3,
            child: IconButton(
              onPressed: toggleFavorite, 
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.deepPurple : Colors.black, 
              ),
            ),
          ),
        ]
      ),
    );
  }

}