import 'package:about_me/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AboutImage extends StatelessWidget {
  const AboutImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 260,
          width: 350,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderSize.extraLargeRadius,
            border: Border.all(color: Colors.black),
          ),
          child: Icon(
            Icons.person,
            size: 80,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                // Implement email functionality
              },
              icon: const Icon(
                Icons.mail,
                color: Colors.black,
              ),
              tooltip: "Email",
            ),
            IconButton(
              onPressed: () {
                // Implement Dribbble functionality
              },
              icon: const Icon(Icons.sports_basketball, color: Colors.black), // Dribbble
              tooltip: "Dribbble",
            ),
            IconButton(
              onPressed: () {
                // Implement Instagram functionality
              },
              icon: const Icon(Icons.camera_alt, color: Colors.black), // Instagram
              tooltip: "Instagram",
            ),
          ],
        ),
      ],
    );
  }
}
