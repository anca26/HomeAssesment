import 'package:custom_app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:custom_app/pages/favorite_page.dart';
import 'package:custom_app/models/product_model.dart';
import 'package:custom_app/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List<Product> allProducts = [];
  List<Product> searchedProducts = [];
  Color backgroundGray = const Color.fromARGB(255, 244, 244, 244);
  String searchText = "";
  
  @override 
  void initState(){
    super.initState();
    fetchProducts();
    }

  Future<void> fetchProducts() async{
    try {
    List<Product> fetchedProducts = await ApiService.fetchProducts();
    setState(() {
      allProducts.addAll(fetchedProducts);
      searchedProducts = fetchedProducts;
      });
    }catch(e){
      debugPrint('Error at fetching products: $e');
    }
  }

  void updateSearch(String value) {
    setState(() {
      searchText = value.toLowerCase();
      searchedProducts = allProducts
          .where((product) => product.productName.toLowerCase().contains(searchText))
          .toList();
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
              onChanged: updateSearch,
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
                      '${allProducts.length} products found',
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
                itemCount: allProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 0.8,
                  ),
                itemBuilder: (context, index) {
                  final product = searchedProducts[index];
                  return ProductItem(product: product);
                },
              ),
            ),
          ]
        ))
        ),
    );
  }
}