import 'package:flutter/material.dart';

class DailySpecialsWidget extends StatelessWidget {
  const DailySpecialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        Text(
          'Daily Specials',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4), // Space between the title and the time
        Text(
          '11:00am to 3:00pm',
          style: TextStyle(
            fontSize: 14, // Smaller font size for the time
            fontStyle: FontStyle.italic, // Optional: make the time italic
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
