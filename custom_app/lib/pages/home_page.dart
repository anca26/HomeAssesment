import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  // tbi: final List<Product> products = [];
  Color backgroundGray = const Color.fromARGB(255, 244, 244, 244);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: backgroundGray,
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
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none
                  ),
                  
              ),
            ),
            SizedBox(height:8.0),
            Expanded(
              child: GridView.builder(
                itemCount: 12, //products.length after fetching 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                  ),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
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