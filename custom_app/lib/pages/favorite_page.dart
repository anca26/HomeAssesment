import 'package:flutter/material.dart';
import 'package:custom_app/pages/home_page.dart';
import 'package:custom_app/widgets/product_item.dart';
import 'package:custom_app/models/product_model.dart';


class FavoritePage extends StatefulWidget{
    List<Product> favorites;

    FavoritePage({required this.favorites});

    @override 
    State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
{

  late List<Product> favoriteProducts;
  Color backgroundGray =  Color.fromARGB(255, 232, 232, 232);

  @override 
  void initState() {
    super.initState();
    favoriteProducts = List.from(widget.favorites);
  }

   void toggleFavorite(Product product){
    setState(() {
      if(favoriteProducts.contains(product))
        favoriteProducts.remove(product);
      else 
        favoriteProducts.add(product);
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Padding (
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  'Favorite Products', 
                  style: TextStyle(
                    color: Colors.white, //change later
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )),
                    Text(
                      '${favoriteProducts.length} products',
                       style: TextStyle(
                        color: Colors.white, //change later
                        fontSize: 16,
                       ),
                    ),
                  ],
                ),
                 IconButton( 
                  icon: 
                    Icon(
                    Icons.home, 
                    size: 40, 
                    color: Colors.white),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ));
                  }
                 ),
              ],),
            SizedBox(height:24),
            Expanded(
              child: GridView.builder(
                itemCount: favoriteProducts.length, 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.8,
                  ),
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return ProductItem(
                    product: product,
                    isFavorite: favoriteProducts.contains(product),
                    onToggleFavorite: () => toggleFavorite(product),
                    );
                },
              ),
            ),
          ]
        ))
        ),
    );
  }
}