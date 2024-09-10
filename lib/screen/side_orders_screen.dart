import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';

class SideOrdersScreen extends StatelessWidget {
  SideOrdersScreen({super.key});

  final List<MenuItem> sideorders = [
    MenuItem(name: 'Mexican Rice', description: '', price: 2.25),
    MenuItem(name: 'Rice w/ Cheese Sauce', description: '', price: 3.25),
    MenuItem(name: 'Refried Beans', description: '', price: 2.25),
    MenuItem(name: 'Sour Cream', description: '', price: 1.99),
    MenuItem(name: 'Pico de Gallo', description: '', price: 1.99),
    MenuItem(name: 'Grilled Vegetables', description: '', price: 2.99),
    MenuItem(name: 'French Fries', description: '', price: 1.99),
    MenuItem(name: 'Jalapenos', description: '', price: 1.99),
    MenuItem(name: 'Green Salsa Tomatillo', description: '', price: 2.99),
    MenuItem(name: 'Shrimp(6)', description: '', price: 4.99),
    MenuItem(name: 'Flour or Corn Tortillas', description: '', price: 1.99),
    // Add more appetizers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('sideorders'),
      ),
      body: ListView.builder(
        itemCount: sideorders.length,
        itemBuilder: (context, index) {
          final menuItem = sideorders[index];
          return MenuItemWidget(
            menuItem: sideorders[index],
            onAddToOrder: () {
              final cartProvider = Provider.of<CartProvider>(context, listen: false);
              cartProvider.addItem(
                CartItem(
                  name: menuItem.name,
                  description: menuItem.description,
                  price: menuItem.price,
                ),
              );
              // Handle adding item to order
            },
          );
        },
      ),
    );
  }
}
