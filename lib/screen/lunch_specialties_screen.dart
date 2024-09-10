import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import '/models/menu_items.dart';
import '/widgets/menu_items_widget.dart';
import '/widgets/cart_provider.dart'; // Import your CartProvider
import '/widgets/cart_item.dart';

class LunchSpecialtiesScreen extends StatelessWidget {
  LunchSpecialtiesScreen ({super.key});

  final List<MenuItem> lunchspecialties = [
    MenuItem(name: 'Fajita Plate', description: 'Choice of chicken, steak or shrimp fajita with vegetables seveed with rice and topped with cheese sauce.', price: 10.99),
    MenuItem(name: 'Pollo Special', description: 'Grilled chicken breast topped with cheese sauce and served with rice, lettuce, tomatoes, mushrooms, onions and sour cream.', price: 8.99),
    MenuItem(name: 'Taco Salad Fajitas', description: 'A crisp flour tortila with melted cheese , topped with your choice of chicken, steak, sauteed with onions, bell peppers, tomatoes and mushrooms. Covered with lettuce, cheese and sour cream', price: 8.99),
    MenuItem(name: 'Chimichanga', description: 'We stuff a flour tortilla with your choice of of chunks of beef or chicken, then deep fired to a golden brown. Topped with cheese sauce, lettuce and sour cream. Served with rice and beans.', price: 7.99),
    MenuItem(name: 'Chimichanga Seafood', description: 'We stuff a flour tortilla with crab meat and shrimp, then deep fired to a golden brown. Topped with cheese sauce, lettuce and sour cream. Served with rice and beans.', price: 7.99),
    MenuItem(name: 'Taquitos Mexicanos', description: 'Two corn tortillas wrapped with your favorite filling, then deep fried to a golder brown. Topped with our special sauce, lettuce, tomato and sour cream. Served with rice and beans', price: 7.99),
    MenuItem(name: 'Special Lunch #1', description: 'Chile relleno, taco, beans and guacamole salad.', price: 7.99),
    MenuItem(name: 'Special Lunch #2', description: 'A beef burrito, Mexican rice and refried beans.', price: 7.99),
    MenuItem(name: 'Special Lunch #3', description: 'Bean burrito, cheese enchilada adn Mexican rice.', price: 7.99),
    MenuItem(name: 'Yucatan Burrito', description: 'A large flour tortilla filled with your choice of seasoneed ground beef or shredded chicken. Topped with red sauce, lettuce, tomato, and sour cream. Served with Mexican rice and beans.', price: 7.99),
    MenuItem(name: 'Fajitas', description: 'We use our special reecipe to cook tender strips of marinated chicken breast or beef skirt steak all covered with onion, bell peppers, tomato, mushrooms, and garnished with letuce an sour cream. Served with tortillas and rice and beans.', price: 12.99),
    MenuItem(name: 'Quesadilla Suprema', description: 'A medium size flour tortilla grilled adn stuffed with tenders strips of marinated chicken or steak, with sauteed onions, bell peppers, mushrooms. garnished with lettuce adn sour cream.', price: 8.99),
    MenuItem(name: 'Costa Enchilada', description: 'One flour tortilla rolled with crab meat and shrimp, topped with cheese sauce. Served with rice and beans.', price: 7.99),
    MenuItem(name: 'Nachos Fajitas', description: 'Cheese nachos with assorted toppings of tender strips of marinated chicken breast or beef skirt steak all covered with onion, bell pepper, mushrooms tomatoes and sour cream.', price: 9.99),
    MenuItem(name: 'Nachos Fajitas Yucatan', description: 'Chicken, steak, shrimp, onions, tommatos, bell peppers and mushrooms topped with cheese sauce, lettuce, and sour cream.', price: 11.99),
    MenuItem(name: 'Chile Relleno Fajita', description: 'A poblano pepper stuffed with potatoes and cheese asn topped with chicken or steak with grilled onions. Served with rice and beans.', price: 9.99),
    MenuItem(name: 'Burrito Fajita', description: 'A flour tortilla stuffed with your choice of chicken or steak with vegetables. Topped with cheese sauce, lettuce, sour cream. Served with rice adn beans.', price: 9.99),
    MenuItem(name: 'Cheese Steak', description: 'Steak topped with cheese suace. Served with rice, beans, and tortillas', price: 8.99),
    MenuItem(name: 'Taco Fajitas', description: 'One soft flour tortilla with your choice of chicken or beef with lettuce and shredded cheese. Served with rice and beans.', price: 7.99),
    MenuItem(name: 'Chimichanga Fajitas', description: 'We stuffed a flour tortilla with tender strips of marinated chicken or beef skirt steak with sauteed onions, bell peppers, mushrooms, tomatoes and garnished with lettuce and sour cream. Served with Mexican rice and beans.', price: 9.99),
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
        itemCount: lunchspecialties.length,
        itemBuilder: (context, index) {
          final menuItem = lunchspecialties[index];
          return MenuItemWidget(
            menuItem: lunchspecialties[index],
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
