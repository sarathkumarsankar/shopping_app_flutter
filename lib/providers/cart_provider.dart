import 'package:flutter/material.dart';
import 'package:shopping_app/model/products.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> cart = [];

  void addToCart(CartItem product) {
    cart.add(product);
    notifyListeners();
  }

  void removeFromCart(CartItem product) {
    cart.remove(product);
    notifyListeners();
  }
}
