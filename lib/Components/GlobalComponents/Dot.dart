import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
