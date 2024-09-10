import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';

class VegetarianCombinationScreen extends StatelessWidget {
  VegetarianCombinationScreen({super.key});

  final List<MenuItem> vegetariancombination = [
    MenuItem(name: 'Vegetarian Fajitas', description: 'With sauteed onions, bell peppers, tomatoes, mushrooms and garnihed with lettuce, sour cream. Served with Mexian rice and beans and three tortillas.', price: 9.99),
    MenuItem(name: 'Vegetarian Burrito', description: 'Two flour tortillas, stuffed with sauteed onion, bell pepper, tomatoes, mushrooms, topped with cheese dip. Garnished with lettuce and sour cream. Served rice and beeans.', price: 9.99),
    MenuItem(name: 'Vegetarian Quesadilla', description: 'All vegetables, sauteed with onions, bell peppers, tomatoes, muchrooms. Served with lettuce and sour cream.', price: 9.99),
    // Add more appetizers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vegetarian Combination'),
      ),
      body: ListView.builder(
        itemCount: vegetariancombination.length,
        itemBuilder: (context, index) {
          final menuItem = vegetariancombination[index];
          return MenuItemWidget(
            menuItem: vegetariancombination[index],
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