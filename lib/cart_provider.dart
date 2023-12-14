import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  
  void addToCart(params) {
    cart.add(params);
  }

    void removeFromCart(params) {
    cart.removeAt(0);
  }
}
