import 'package:flutter/material.dart';

class PricelistIcon extends StatefulWidget {
  final String title;
  final String price;
  final Color? priceColor;
  const PricelistIcon({
    this.priceColor = Colors.black,
    super.key,
    required this.title,
    required this.price,
  });

  @override
  State<PricelistIcon> createState() => _PricelistIconState();
}

class _PricelistIconState extends State<PricelistIcon> {
  int? _discountAmount;

  @override
  void initState() {
    _discountAmount = int.parse(widget.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
              Icon(
                Icons.delete_outlined,
                color: Colors.grey[600],
              )
            ],
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
                    color: widget.priceColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: _discountAmount.toString(),
                  style: TextStyle(
                    fontSize: 17,
                    color: widget.priceColor,
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
