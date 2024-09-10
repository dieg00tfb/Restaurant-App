import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';

class AppetizersScreen extends StatelessWidget {
  AppetizersScreen({super.key});

  final List<MenuItem> appetizers = [
    MenuItem(name: 'Bean Dip', description: '', price: 4.25),
    MenuItem(name: 'Guacamole Dip', description: '', price: 4.50),
    MenuItem(name: 'Cheese Dip', description: '', price: 4.50),
    MenuItem(name: 'Nachos with Cheese', description: '', price: 5.50),
    MenuItem(name: 'Nachos with Beans', description: '', price: 5.00),
    MenuItem(name: 'Nachos (Beef or Chicken)', description: '', price: 7.50),
    MenuItem(name: 'Guacamole Salad', description: '', price: 4.99),
    MenuItem(name: 'Chorizo Con Queso', description: '', price: 6.99),
    MenuItem(name: 'Spinach & Artichoke Dip', description: '', price: 7.99),
    MenuItem(name: 'Shrimp Tostadas', description: 'Hard shell filled with sour cream, fresh shimp, an avacado slice, and pico de gallo.', price: 11.99),
    MenuItem(name: 'Quesadilla Rellena', description: 'A flour tortilla stuffed with beef and beans served with lettuce and sour cream.', price: 7.99),
    MenuItem(name: 'Ceviche Tostadas', description: 'Flat crisp corn tortilla covered with ground fish an dpico de gallo', price: 11.99),
    MenuItem(name: 'Nachos Yucatan', description: 'Cheese Nachos with assorted topping of beef, chicken, and refried beans. All covered with lettuce, tomatoes, and sour cream.', price: 9.99),
    // Add more appetizers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('appetizers'),
      ),
      body: ListView.builder(
        itemCount: appetizers.length,
        itemBuilder: (context, index) {
          final menuItem = appetizers[index];
          return MenuItemWidget(
            menuItem: appetizers[index],
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
