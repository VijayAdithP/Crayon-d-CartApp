import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CartSearchbar extends StatefulWidget {
  const CartSearchbar({super.key});

  @override
  State<CartSearchbar> createState() => _CartSearchbarState();
}

class _CartSearchbarState extends State<CartSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: HexColor("#e5e5e5"),
            borderRadius: BorderRadius.circular(
              10,
            ),
            border: Border.all(
              color: Colors.grey[500]!,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.grey[700],
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[700],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
