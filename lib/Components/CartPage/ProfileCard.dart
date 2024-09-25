import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 5,
      ),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: 70,
              decoration: BoxDecoration(
                color: HexColor("#c4c8cb"),
                borderRadius: BorderRadius.circular(
                  10,
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/img/download__2_-removebg-preview.png"),
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: HexColor("#052437"),
                  ),
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/img/profile.jpeg",
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
