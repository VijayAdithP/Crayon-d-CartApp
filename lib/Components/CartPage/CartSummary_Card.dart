import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CartSummaryCards extends StatelessWidget {
  final IconData icon;
  const CartSummaryCards({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: HexColor("#e5e5e5"),
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: Colors.grey[500]!,
        ),
      ),
      child: Icon(
        icon,
        color: Colors.grey[800],
      ),
    );
  }
}
