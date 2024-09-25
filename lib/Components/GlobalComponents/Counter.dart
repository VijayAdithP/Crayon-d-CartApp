import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Counter extends StatefulWidget {
  final GestureTapCallback decrementCounter;
  final GestureTapCallback incrementCounter;
  final double verPadding;
  final double horPadding;
  final int count;
  const Counter(
      {super.key,
      required this.decrementCounter,
      required this.incrementCounter,
      required this.count,
      required this.verPadding,
      required this.horPadding});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: HexColor("#b6babc"),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: widget.verPadding,
          horizontal: widget.horPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: widget.decrementCounter,
              child: const Icon(
                Icons.remove,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.count.toString(),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: widget.incrementCounter,
              child: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
