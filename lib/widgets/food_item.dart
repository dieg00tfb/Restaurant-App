import 'package:flutter/material.dart';
import '/widgets/cart_provider.dart';
import '/widgets/cart_item.dart';
import 'package:provider/provider.dart';


class FoodItemWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final String day;

  const FoodItemWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 255, 255, 255),

      ),
      child: Column(
        children: [
          const SizedBox(height: 3),
          Text(
            day, // Display the day at the top
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Image.asset(
            imagePath,
            width: 150,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 2),
          Text(
            name, 
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 1),
          ElevatedButton(
            onPressed: (){
              final cartProvider = Provider.of<CartProvider>(context, listen: false);
              final priceValue = double.tryParse(price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0;
              cartProvider.addItem(
                CartItem(
                  name: name,
                  description: 'Description of $name', // Provide description if available
                  price: priceValue,
                ),
              ); // Handle adding item to order
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              foregroundColor: Colors.white, // Set the background color to red
              side: const BorderSide(color: Colors.black, width: 2.0),
            ),
            child: const Text('Add to Order'),
          ),
        ],
      ),
    );
  }
}
