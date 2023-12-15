import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: cart.isEmpty ? const Center(child: Text("Your cart is empty:)", style: TextStyle(fontSize: 16 ),)) : ListView.builder(
          itemCount: cart.length,
          itemBuilder: ((context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Image.asset(cartItem.imageUrl),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext content) {
                        return AlertDialog(
                          title: const Text('Cofirmaton'),
                          titleTextStyle: const TextStyle(color: Colors.black),
                          content: const Text(
                              'Are you sure you want to delete this item?'), // Add a subtitle here
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .removeFromCart(cartItem);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ),
              title: Text(
                cartItem.title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text('Size: ${cartItem.size},    Price: £${cartItem.price}'),
            );
          }
          )
          ) 
    );
  }
}
