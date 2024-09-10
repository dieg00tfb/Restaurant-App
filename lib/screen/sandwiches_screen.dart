import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';


class SandwichesScreen extends StatelessWidget {
  SandwichesScreen({super.key});

  final List<MenuItem> sandwiches = [
    MenuItem(name: 'Yucatan Burger', description: 'Grilled to your taste and garnished with lettuce, tomato, onions, and pickles. Served with French fries and sliced avocados.', price: 7.99),
    MenuItem(name: 'Cheese Burger', description: 'Served with French fries and garnished with lettuce and tomato.', price: 7.99),
    MenuItem(name: 'Chicken Sandwich w/cheese sauce', description: 'Boneless breast of chicken, grilled and topped with cheese sauce and garnished with lettuce, tomato, and onion.', price: 7.99),
    // Add more appetizers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('EXPRESS LUNCH'),
      ),
      body: ListView.builder(
        itemCount: sandwiches.length,
        itemBuilder: (context, index) {
          final menuItem = sandwiches[index];
          return MenuItemWidget(
            menuItem: sandwiches[index],
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
