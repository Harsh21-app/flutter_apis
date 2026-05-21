import 'package:apis_practice/ecommerce_ui/cart_data.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + item["price"] as int);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cartItems.isEmpty?
      const Center(
        child: Text('Cart is empty'),
      ):Column(
        children: [
          Expanded(child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context,index){
                final item = cartItems[index];

                return ListTile(
                  leading: Image.network(item["image"],width: 50,height: 50,fit: BoxFit.cover,),
                  title: Text(item["name"]),
                  subtitle: Text("₹${item["price"]}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: (){
                      setState(() {
                        cartItems.removeAt(index);
                      });
                    },
                  ),
                );
              })),
          Padding(padding: const EdgeInsets.all(16),
          child: Text(
            "Total:₹$totalPrice",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),)
        ],
      ),
    );
  }
}
