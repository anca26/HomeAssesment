import 'package:flutter/material.dart';
import 'package:custom_app/models/product_model.dart';
import 'package:custom_app/pages/product_page.dart';
import 'package:custom_app/globals.dart' as globals;


class ProductItem extends StatefulWidget{

  final Product product;
  bool isFavorite;
  final VoidCallback onToggleFavorite;
  ProductItem({required this.product, required this.isFavorite, required this.onToggleFavorite});


  @override
  State<ProductItem> createState() => _ProductItemState();
}


class _ProductItemState extends State<ProductItem>{

  void checkFavorite(Product product){
    setState(() {
      if(globals.favoriteProducts.contains(product))
        widget.isFavorite = true;
    });
  }

  @override
  Widget build(BuildContext context){
    checkFavorite(widget.product);
    return GestureDetector(
      onTap:() => {
        Navigator.push(context, MaterialPageRoute(
        builder: (context) => ProductPage(product: widget.product),),)
      },
      child: Container(
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
                widget.product.productName.split(' ').take(3).join(' '),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                 ),
              ),
              Text(
                widget.product.productName.split(' ').skip(3).take(4).join(' '),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
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
              onPressed: widget.onToggleFavorite, 
              icon: Icon(
                widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: widget.isFavorite ? Colors.deepPurple : Colors.black, 
              ),
            ),
          ),
        ]
      ),
    ),
  );
  }

}