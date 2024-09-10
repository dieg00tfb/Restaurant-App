import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import '/widgets/cart_provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final Map<String, String> customNotes = {};
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Access the CartProvider
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: cartProvider.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Cart is empty',
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final item = cartProvider.items[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.all(8.0),
                              title: Text(item.name),
                              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  cartProvider.removeItem(item);
                                },
                              ),
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'Add custom notes (e.g., extra cheese)',
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) => _onCustomNoteChanged(item.name, value),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Your Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _confirmOrder(cartProvider);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    ),
                    child: const Text('Confirm Order'),
                  ),
                ),
              ],
            ),
    );
  }

  void _onCustomNoteChanged(String itemName, String note) {
    setState(() {
      customNotes[itemName] = note;
    });
  }

  Future<void> _sendOrderEmail(String message, CartProvider cartProvider) async {
    try {
      final response = await http.post(
        Uri.parse('http://123.456.78.9/send-email'), // Update with a backend URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'message': message,
          'subject': 'Order Confirmation',
          'recipient': 'rastaurantname@buisness.com', // Replace with the restaurant's buisness email address
        }),
      );

      if (response.statusCode == 200) {
        // Close the loading dialog
        Navigator.of(context).pop();

        // Show the confirmation dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Thank You!'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Your order will be ready in 10-15 minutes.'),
                  const SizedBox(height: 10),
                  Text(
                    'Estimated Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text('Please pay at the register in the restaurant.'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    cartProvider.checkout();
                    // Close the dialog
                    Navigator.pop(context);
                    // Navigate back to the home screen
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        print('Failed to send email: ${response.reasonPhrase}');
        Navigator.of(context).pop();
      }
    } catch (e) {
      print("Failed to send email: $e");
      Navigator.of(context).pop();
    }
  }

  void _confirmOrder(CartProvider cartProvider) async {
    String customerName = _nameController.text.trim();
    String message = 'Order Confirmation:\nName: $customerName\n';

    for (var item in cartProvider.items) {
      message += '- ${item.name}';
      if (customNotes.containsKey(item.name) && customNotes[item.name]!.isNotEmpty) {
        message += ' (Custom: ${customNotes[item.name]})';
      }
      message += '\n';
    }

    message += 'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}';

    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text(
                  'Sending order...',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );

    // Send the order via email
    await _sendOrderEmail(message, cartProvider);
  }
}
