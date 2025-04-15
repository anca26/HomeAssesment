import 'package:flutter/material.dart';
import 'package:custom_app/pages/home_page.dart';


class FavoritePage extends StatefulWidget{
    const FavoritePage({super.key});

    @override 
    State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
{
  Color backgroundGray = const Color.fromARGB(255, 244, 244, 244);
  int itemCount = 6; //delete this later

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
                      '${itemCount} products',
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
                itemCount: itemCount, //products.length after fetching 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.8,
                  ),
                itemBuilder: (context, index) {
                  //tbi  DisplayItem(product: product)
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Item ${index +1}',
                    ),
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