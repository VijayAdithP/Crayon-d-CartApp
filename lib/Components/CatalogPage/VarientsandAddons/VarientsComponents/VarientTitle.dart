import 'package:flutter/material.dart';

class VarientTitle extends StatelessWidget {
  final String title;
  final IconData titleIcon;
  const VarientTitle({
    super.key,
    required this.title,
    required this.titleIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              border: Border.all(
                width: 2,
                color: Colors.black45,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                titleIcon,
                color: Colors.black45,
              ),
            ),
          ),
        )
      ],
    );
  }
}
