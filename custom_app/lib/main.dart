import 'package:custom_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:custom_app/pages/home_page.dart';
import 'package:custom_app/models/product_model.dart';

void main() {
  runApp(const MyApp());
  //testAPI();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Catalog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   
  List pages = [
     HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.lightBlue,
      //   title: Text(widget.title),
      //   centerTitle: true,
      // ),
      body: HomePage()
    );
  }
}

// void testAPI() async {
//   try{
//     List<Product> products = await ApiService.fetchProducts();
//     for (var product in products) {
//       print('name: ${product.productName}');
//       print('price: ${product.productPrice}');
      
//     }
//     }catch(e){
//       print('Error $e');
//     }
//   }

