import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';


class DessertsScreen extends StatelessWidget {
  DessertsScreen({super.key});

  final List<MenuItem> desserts = [
    MenuItem(name: 'Sopapilla', description: 'A flour tortilla deep fried to a golden brown and topped with honey, butter and cinnamon', price: 4.99),
    MenuItem(name: 'Flan', description: 'Traditional Mexico city-style creme, caramel cake, baked fresh daily.', price: 4.99),
    MenuItem(name: 'Fried Ice Cream', description: 'Vanilla ice cream in a fried tortilla shell. Covered with whipped cream and chocolate cream and chocolate syrup.', price: 5.99),
  
  ];
  // Add more appetizers here


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('DESSERTS'),
      ),
      body: ListView.builder(
        itemCount: desserts.length,
        itemBuilder: (context, index) {
          final menuItem = desserts[index];
          return MenuItemWidget(
            menuItem: desserts[index],
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
