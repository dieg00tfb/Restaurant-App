import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';

class StreetTacosScreen extends StatelessWidget {
  StreetTacosScreen({super.key});

  final List<MenuItem> streettacos = [
    MenuItem(name: '(3) Carnitas', description: '', price: 13.99),
    MenuItem(name: '(3) Carne Asada', description: '', price: 13.99),
    MenuItem(name: '(3) Campechanos', description: '', price: 13.99),
    MenuItem(name: '(3) Grilled Chicken', description: '', price: 13.99),
    MenuItem(name: '(3) Shrimp', description: '', price: 13.99),
    // Add more appetizers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('STREET TACOS'),
      ),
      body: ListView.builder(
        itemCount: streettacos.length,
        itemBuilder: (context, index) {
          final menuItem = streettacos[index];
          return MenuItemWidget(
            menuItem: streettacos[index],
            onAddToOrder: () {
              final cartProvider = Provider.of<CartProvider>(context, listen: false);
              cartProvider.addItem(
                CartItem(
                  name: menuItem.name,
                  description: menuItem.description,
                  price: menuItem.price,
                ),
              );// Handle adding item to order
            },
          );
        },
      ),
    );
  }
}
