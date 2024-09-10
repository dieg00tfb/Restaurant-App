import 'package:flutter/material.dart';
import '/widgets/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  bool get isEmpty => _items.isEmpty;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }

  void checkout() {
    // Handle the checkout process here, e.g., send order to server
    // Clear the cart
    _items.clear();
    notifyListeners();
  }

  static of(BuildContext context) {}

  // Add more methods as needed, e.g., clearing the cart, getting total price, etc.
}
