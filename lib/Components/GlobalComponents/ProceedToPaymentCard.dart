import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomBillCard extends StatelessWidget {
  const BottomBillCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.1,
      decoration: BoxDecoration(
        color: HexColor("#e5e5e5"),
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey[400]!,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Row(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                color: HexColor("#e5e5e5"),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.print,
                      color: HexColor("#1059c8"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Print bill",
                      style: TextStyle(
                        color: HexColor("#1059c8"),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: HexColor("#1059c8"),
                ),
                child: const Center(
                  child: Text(
                    "Proceed to payment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
