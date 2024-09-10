import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure you have this import
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';

class KidsMenuScreen extends StatelessWidget {
  KidsMenuScreen({super.key});

  final List<MenuItem> kidsmenu = [
    MenuItem(name: 'Chicken Nuggets w/ French Fries', description: '', price: 5.99),
    MenuItem(name: 'Cheese Burger w/ French Fries', description: '', price: 5.99),
    MenuItem(name: 'Cheese Quesadilla w/ Mexican Rice', description: '', price: 5.99),
    MenuItem(name: 'Taco: Chicken or Beef w/ Mexican Rice', description: '', price: 5.99),
    MenuItem(name: 'Burrito: Chicken or Beef w/ Mexican Rice', description: '', price: 5.99),
    MenuItem(name: 'Enchilada', description: 'Soft corn tortilla with choice of filling, served with enchilada sauce, cheese and Mexican Rice.', price: 5.99),
    MenuItem(name: 'Mini Chimichanga', description: 'Shredded chicken or beef. Topped with cheese sauce.', price: 5.99),
    MenuItem(name: 'Chicken and Rice', description: '', price: 5.99),
    MenuItem(name: 'French Fries w/ Fajita Meat', description: '', price: 5.99),
    MenuItem(name: 'Nachos with Cheese', description: '', price: 5.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('KIDS MENU'),
      ),
      body: ListView.builder(
        itemCount: kidsmenu.length,
        itemBuilder: (context, index) {
          final menuItem = kidsmenu[index];
          return MenuItemWidget(
            menuItem: menuItem, // Passing the menuItem to MenuItemWidget
            onAddToOrder: () {
              final cartProvider = Provider.of<CartProvider>(context, listen: false);
              cartProvider.addItem(
                CartItem(
                  name: menuItem.name,
                  description: menuItem.description,
                  price: menuItem.price,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
