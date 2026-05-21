import 'package:apis_practice/ecommerce_ui/cart_screen.dart';
import 'package:apis_practice/ecommerce_ui/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Shoes",
      "price":1000,
      "image": "https://picsum.photos/200?1"
    },
    {
      "name": "T-Shirt",
      "price": 500,
      "image": "https://picsum.photos/200?2"
    },
    {
      "name": "Watch",
      "price": 2000,
      "image": "https://picsum.photos/200?3"
    },
    {
      "name": "Bag",
      "price": 1500,
      "image": "https://picsum.photos/200?4"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
          actions:[
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen())
              );
            }, icon:const Icon(Icons.shopping_cart))

          ]
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            childAspectRatio: 0.75
          ), itemBuilder: (context,index){
          final item = products[index];

          return GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductScreen(product:item),));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Image.network(
                      item["image"],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ),

                  Padding(padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item["name"],style: const TextStyle(fontWeight: FontWeight.bold),),
                      const SizedBox(height: 5,),
                      Text("₹${item["price"]}")
                    ],
                  ),)
                ],
              ),
            ),
          );
      }),

    );
  }
}
