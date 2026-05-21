import 'package:apis_practice/ecommerce_ui/cart_data.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product["name"]),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(product["image"],height: 220,),
            const SizedBox(height: 20,),
            
            Text(product["name"],
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),),
            
            const SizedBox(height: 10,),
            
            Text("Price:₹${product["price"]}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 30,)
          ,SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  cartItems.add(product);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Added to cart"),)
                  );
                },
                child: const Text("Add to Cart"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
