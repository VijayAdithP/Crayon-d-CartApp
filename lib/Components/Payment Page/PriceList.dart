import 'package:flutter/material.dart';

class PricingText extends StatelessWidget {
  final String title;
  final String price;
  final Color? priceColor;
  const PricingText({
    this.priceColor = Colors.black,
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          RichText(
            overflow: TextOverflow.clip,
            textAlign: TextAlign.end,
            textDirection: TextDirection.ltr,
            softWrap: true,
            maxLines: 1,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "SAR ",
                  style: TextStyle(
                    fontSize: 17,
                    color: priceColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: price,
                  style: TextStyle(
                    fontSize: 17,
                    color: priceColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
