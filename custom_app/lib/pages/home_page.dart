import 'package:flutter/material.dart';
import 'package:custom_app/pages/favorite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  // tbi: final List<Product> products = [];
  Color backgroundGray = const Color.fromARGB(255, 244, 244, 244);
  int itemCount = 12; //delete this later

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Padding (
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search product', 
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none
                  ),
                  
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  'Products', 
                  style: TextStyle(
                    color: Colors.white, //change later
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  )),
                    Text(
                      '${itemCount} products found',
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
                    Icons.favorite_border, 
                    size: 40, 
                    color: Colors.white),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage() ));
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
                      borderRadius: BorderRadius.circular(16.0),
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