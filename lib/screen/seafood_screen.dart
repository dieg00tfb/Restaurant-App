import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';

class SeafoodScreen extends StatelessWidget {
  SeafoodScreen({super.key});

  final List<MenuItem> seafood = [
    MenuItem(name: 'Shrimp Quesadilla', description: 'A grilled flour tortilla with shrimp, cheese, sauteed onions, bell peppers and mushrooms. Garnished with lettuce, tomatoes, and sour cream.', price: 15.99),
    MenuItem(name: 'Enchilada Vallarta', description: 'Four rolled flour tortillas, stuffed with shrimp and crab meat topped with cheese sauce.', price: 12.99),
    MenuItem(name: 'Shrimp Chimichanga', description: 'We stuff a flour tortilla with shrimp, sauteed onions, mushrooms, bell peppers, and tomato then deep fried to a golden brown. Topped with cheese sauce, lettuce, and sour cream. Served with Mexican rice and beans.', price: 15.99),
    MenuItem(name: 'Coktel', description: '12 shrimp with tomato juice, pico de gallo, avocado and saltine crackers.', price: 13.99),
    MenuItem(name: 'Camarones a la Diabla', description: '12 grilled shrimp in a spicy sauce. Served with rice, beans adn tortillas.', price: 16.99),
    MenuItem(name: 'Mar y Tierra', description: 'One dozen shrimp with marinated chicken and steak and chile rellenos and sour cream. Served with Mexican rice, lettuce, and sour cream.', price: 18.99),
    MenuItem(name: 'Pescador', description: 'One dozen shrimp seasoned with our special recipe. Sauteed with vegetables and tomato. Served with Mexican rice, lettuce, sour cream and onions.', price: 16.99),
    MenuItem(name: 'El Amigo', description: 'Two flour tortillas rolled with marinated steak and 1/2 dozen shrimp, topped with enchilada cheese sauces served with Mexican, lettuce and sour cream.', price: 16.99),
    MenuItem(name: 'Enchiladas Yucatan', description: 'Three shrimp corn tortilla enchiladas topped with cheese sauce. Served with rice and beans.', price: 12.99),
    MenuItem(name: 'Fish Tacos', description: 'Two flour tortillas stuffed with fish, lettucce, shredded cheeese adn served with rice and beans.', price: 11.99),
    MenuItem(name: 'Chimichanga Seafood', description: 'We stuffed a flour tortilla with crab meat and shrimp, then deep fried to golden brown. Topped with cheese sauce, lettuce adn sour cream. Served with Mexican rice and beans.', price: 12.99),
    MenuItem(name: 'Fillet a la Plancha', description: '', price: 7.99),
    MenuItem(name: '', description: 'Two grilled fish filets topped with shrimp. Served with rice, lettuce, avocado, and tomato.', price: 16.99),
    // Add more appetizers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SEAFOOD'),
      ),
      body: ListView.builder(
        itemCount: seafood.length,
        itemBuilder: (context, index) {
          final menuItem = seafood[index];
          return MenuItemWidget(
            menuItem: seafood[index],
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
