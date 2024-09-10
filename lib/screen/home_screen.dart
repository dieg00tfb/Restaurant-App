import 'package:flutter/material.dart';
import 'package:restaurant_app/screen/menu_screen.dart';
import '/widgets/daily_specials.dart';
import '/widgets/food_item.dart';
import '/navigation/bottom_navigation.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _currentIndex = 0;
   // Track the current index for the BottomNavBar
  void _incrementCounter() {
    setState(() {
    });
  }
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
      body: Column(
        children: [
          // Image section taking up a third of the screen
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            child: Stack(
              children: [
                Image.asset(
                  'lib/assets/main-image.jpg', // Ensure this path is correct
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white, // Set the background color to red
                        side: const BorderSide(color: Colors.black, width: 2.0),
                      ),
                      child: const Text('View Menu'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Daily Specials widget
          const DailySpecialsWidget(),
          // Horizontally scrolling row of food items
          const SizedBox(
            height: 250, // Height for the scrolling row
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Replace these placeholders with your actual food item data
                  FoodItemWidget(
                    day: 'Monday',
                    imagePath: 'lib/assets/fajitas_image.png',
                    name: 'Fajitas',
                    price: '\$9.99',
                  ),
                  SizedBox(width: 16),
                  FoodItemWidget(
                    day: 'Tuesday',
                    imagePath: 'lib/assets/burrito_fajita_image.png',
                    name: 'Burrito Fajita',
                    price: '\$8.99',
                  ),
                  SizedBox(width: 16),
                  FoodItemWidget(
                    day: 'Wednesday',
                    imagePath: 'lib/assets/pollo_special_image.png',
                    name: 'Pollo Special',
                    price: '\$7.99',
                  ),
                  SizedBox(width: 16),
                  FoodItemWidget(
                    day: 'Thursday',
                    imagePath: 'lib/assets/nachos_fajitas_image.png',
                    name: 'Nachos Fajita',
                    price: '\$8.99',
                  ),
                  SizedBox(width: 16),
                  FoodItemWidget(
                    day: 'Friday',
                    imagePath: 'lib/assets/cheese_steak_image.PNG',
                    name: 'Cheese Steak',
                    price: '\$7.99',
                  ),
                  SizedBox(width: 16),
                  // Add more FoodItemWidget instances as needed
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: _currentIndex),// Use the NavBar widget here
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

