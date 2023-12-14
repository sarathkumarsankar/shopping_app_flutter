import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/cart_provider.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: ((context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Image.asset(cartItem['imageUrl'] as String),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ),
              title: Text(
                cartItem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text('Size: ${cartItem["size"]}'),
            );
          })),
    );
  }
}
