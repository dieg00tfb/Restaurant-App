import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';

class CombinationDinnerScreen extends StatelessWidget {
  CombinationDinnerScreen ({super.key});

  final List<MenuItem> combinationdinner = [
    MenuItem(name: '1. One taco, one enchilada, and one chalupa.', description: '', price: 10.99),
    MenuItem(name: '2. One enchilada, taco, adn chile relleno.', description: '', price: 10.99),
    MenuItem(name: '3. Two tacos, one enchilada and chile con queso.', description: '', price: 10.99),
    MenuItem(name: '4. Two tacos, one enchilada and chile con queso.', description: '', price: 10.99),
    MenuItem(name: '5. One burrito, one taco, and one enchilada.', description: '', price: 10.99),
    MenuItem(name: '6. Two tacos, Mexican rice, and refired beans.', description: '', price: 10.99),
    MenuItem(name: '7. One enchilada, one Tamale, Mexican rice and refried beans.', description: '', price: 10.99),
    MenuItem(name: '8. One enchilada, chile relleno, Mexican rice and refried beans.', description: '', price: 10.99),
    MenuItem(name: '9. One enchilada, one taco, Mexican rice and refried beans.', description: '', price: 10.99),
    MenuItem(name: '10. Two enchiladas, Mexican rice and refried beans.', description: '', price: 10.99),
    MenuItem(name: '11. One enchilada, one burrito and one chile relleno.', description: '', price: 10.99),
    MenuItem(name: '12. One beef burrito, One enchilada and one tamale.', description: '', price: 10.99),
    MenuItem(name: '13. One chile relleno and two enchilada.', description: '', price: 10.99),
    MenuItem(name: '14. One chalupa, one chile relleno and one enchilada.', description: '', price: 10.99),
    MenuItem(name: '15. One chalupa, one chile relleno and one burrito.', description: '', price: 10.99),
    MenuItem(name: '16. One burrito, one enchilada, Mexican rice and refried beans.', description: '', price: 10.99),
    MenuItem(name: '17. Two chile Rellenos with rice and beans.', description: '', price: 10.99),
    MenuItem(name: '18. One chalupa, one taco, adn one tostada.', description: '', price: 10.99),
    MenuItem(name: '19. One Chile Relleno, one burrito, and Mexican rice.', description: '', price: 10.99),
    MenuItem(name: '20. One taco, one burrito, and one chalupa.', description: '', price: 10.99),
    MenuItem(name: '21. One taco, chile relleno, Mexican rice and refried beans.', description: '', price: 10.99),
    MenuItem(name: '22. Two tamales with rice and beans.', description: '', price: 10.99),
    MenuItem(name: '23. One taco, one burritro, Mexian rice and refried beans.', description: '', price: 10.99),
    // Add more appetizers here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('combinationdinner'),
      ),
      body: ListView.builder(
        itemCount: combinationdinner.length,
        itemBuilder: (context, index) {
          final menuItem = combinationdinner[index];
          return MenuItemWidget(
            menuItem: combinationdinner[index],
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