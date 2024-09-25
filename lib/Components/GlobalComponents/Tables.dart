import 'package:flutter/material.dart';

class TablesWidget extends StatelessWidget {
  final IconData icon;
  final String data;
  const TablesWidget({
    required this.icon,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey[800],
        ),
        Text(
          data,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
