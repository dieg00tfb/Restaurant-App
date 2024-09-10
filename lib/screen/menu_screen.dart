import 'package:flutter/material.dart';
import '/navigation/bottom_navigation.dart';
import '/screen/express_lunch_screen.dart';
import '/screen/lunch_specialties_screen.dart';
import '/screen/appetizers_screen.dart';
import '/screen/sandwiches_screen.dart';
import '/screen/side_orders_screen.dart';
import '/screen/combination_dinner_screen.dart';
import '/screen/vegetarian_combination_screen.dart';
import '/screen/yucatan_specials_screen.dart';
import '/screen/seafood_screen.dart';
import '/screen/street_tacos_screen.dart';
import '/screen/kids_menu_screen.dart';
import '/screen/desserts_screen.dart';
// Import other menu list pages here

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  // List of food items with image, name, and corresponding menu page
  final List<Map<String, dynamic>> foodItems = [
    {'imagePath': 'lib/assets/speedy_gonzales.png', 'name': 'EXPRESS LUNCH', 'page': ExpressLunchScreen()},
    {'imagePath': 'lib/assets/quesadilla_image.PNG', 'name': 'LUNCH SPECIALTIES', 'page': LunchSpecialtiesScreen()},
    {'imagePath': 'lib/assets/appetizers_image.png', 'name': 'APPETIZERS', 'page': AppetizersScreen()},
    {'imagePath': 'lib/assets/cheeseburger_image.png', 'name': 'SANDWICHES', 'page': SandwichesScreen()},
    {'imagePath': 'lib/assets/appetizers_image.png', 'name': 'SIDE ORDERS', 'page': SideOrdersScreen()},
    {'imagePath': 'lib/assets/combo_5.png', 'name': 'COMBINATION DINNERS', 'page': CombinationDinnerScreen()},
    {'imagePath': 'lib/assets/vegetarian_burrito_image.png', 'name': 'VEGETARIAN COMBINATIONS', 'page': VegetarianCombinationScreen()},
    {'imagePath': 'lib/assets/yucatan_specials_image.png', 'name': 'YUCATAN SPECIALS', 'page': YucatanSpecialsScreen()},
    {'imagePath': 'lib/assets/el_amigo_image.PNG', 'name': 'SEAFOOD', 'page': SeafoodScreen()},
    {'imagePath': 'lib/assets/combo_5.png', 'name': 'STREET TACOS', 'page': StreetTacosScreen()},
    {'imagePath': 'lib/assets/chicken_nuggets_image.png', 'name': 'KIDS MENU', 'page': KidsMenuScreen()},
    {'imagePath': 'lib/assets/churros_image.png', 'name': 'DESSERTS', 'page': DessertsScreen()},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'lib/assets/logo-image.png', // Ensure this path is correct
          height: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            childAspectRatio: 1.0, // Adjust as needed
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: foodItems.length, // Number of items in the grid
          itemBuilder: (context, index) {
            final item = foodItems[index];
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),// Black border
            child: InkWell(
              onTap: () {
                // Navigate to the respective menu list page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['page']),
                );
              },
              child: GridTile(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      item['imagePath']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 120, // Adjust the height as needed
                    ),
                    const SizedBox(height: 8), // Spacing between image and name
                    Text(
                      item['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 18, shadows: [
            Shadow(
              offset: Offset(1.0, 1.0), // Shadow offset
              color: Colors.black, // Shadow color
              blurRadius: 3.0, // Shadow blur radius
            ),
            Shadow(
              offset: Offset(-1.0, -1.0), // Shadow offset
              color: Colors.black, // Shadow color
              blurRadius: 3.0, // Shadow blur radius
            ),
            Shadow(
              offset: Offset(1.0, -1.0), // Shadow offset
              color: Colors.black, // Shadow color
              blurRadius: 3.0, // Shadow blur radius
            ),
            Shadow(
              offset: Offset(-1.0, 1.0), // Shadow offset
              color: Colors.black, // Shadow color
              blurRadius: 3.0, // Shadow blur radius
            ),
          ],),
                    ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
