import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/home_screen.dart';
import '/screen/menu_screen.dart';
import '/screen/my_cart_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), // Change the icon to a cart icon
          label: 'My Cart', // Change the label to "My Cart"
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0 && currentIndex != 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page',)),
          );
        } else if (index == 1 && currentIndex != 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MenuScreen()),
          );
        } else if (index == 2 && currentIndex != 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CheckoutScreen()),
          // Navigate to the location page when it's ready
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => const LocationPage()),
          // );
          );
        }
      },
    );
  }
}