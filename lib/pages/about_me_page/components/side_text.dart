import 'package:flutter/material.dart';

class SideText extends StatelessWidget {
  const SideText({
    super.key,
  });

  TextStyle get _titleTextStyle => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        height: 1.3,
      );

  TextStyle get _bodyTextStyle => const TextStyle(
        fontSize: 16,
        height: 1.5,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Just to remind you, I'm Omar. \nA UX Researcher & Product Designer from Manhattan, New York.",
          style: _titleTextStyle,
        ),
        const SizedBox(height: 16),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
          "Amet amet tristique ipsum aliquam. Vulputate dolor, nunc phasellus vestibulum "
          "turpis posuere turpis eget vel.",
          style: _bodyTextStyle,
        ),
        const SizedBox(height: 16),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
          "Amet amet tristique ipsum aliquam. Vulputate dolor, nunc phasellus vestibulum "
          "turpis posuere turpis eget vel.",
          style: _bodyTextStyle,
        ),
        const SizedBox(height: 24),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Text("Download Resume"),
            ),
          ),
        ),
      ],
    );
  }
}
