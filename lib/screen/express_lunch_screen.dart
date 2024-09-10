import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';

class ExpressLunchScreen extends StatelessWidget {
  ExpressLunchScreen({super.key});

  final List<MenuItem> expresslunch = [
    MenuItem(name: 'Taco Salad', description: 'Chicken or Beef. A crisp flour tortilla with melted cheese sauce topped with lettuce, tomato, cheese, and sour cream.', price: 7.99),
    MenuItem(name: 'Chicken Salad', description: 'Grilled chicken breast topped with lettuce, onions, tomato, peppers and cheese.', price: 7.99),
    MenuItem(name: 'Speedy Gonzales', description: 'One enchilada, one taco, filled with your choice of chicken or beef and served with your choice of rice or beans.', price: 7.99),
    MenuItem(name: 'Huevos with Choirizo', description: 'Scrambled eggs with chorizo. Served with Mexican rice and beans and tortillas..', price: 7.99),
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
        itemCount: expresslunch.length,
        itemBuilder: (context, index) {
          final menuItem = expresslunch[index];
          return MenuItemWidget(
            menuItem: expresslunch[index],
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
