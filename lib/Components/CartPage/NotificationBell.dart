import 'package:flutter/material.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return const Badge(
      label: Text("9"),
      backgroundColor: Colors.red,
      child: Icon(
        Icons.notifications_none_rounded,
        size: 30,
      ),
    );
  }
}
