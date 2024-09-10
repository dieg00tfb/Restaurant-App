import 'package:flutter/material.dart';
import '/models/menu_items.dart';


class MenuItemWidget extends StatelessWidget {
  final MenuItem menuItem;
  final VoidCallback onAddToOrder;

  const MenuItemWidget({
    super.key,
    required this.menuItem,
    required this.onAddToOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(menuItem.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(menuItem.description),
            const SizedBox(height: 8),
            Text('\$${menuItem.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, color: Colors.blue)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: onAddToOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red background
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), // Padding
                foregroundColor: Colors.white, // White text color
                side: const BorderSide(color: Colors.black, width: 2.0), // Black border
              ),
              child: const Text('Add to Order'),
            ),
          ],
        ),
      ),
    );
  }
}