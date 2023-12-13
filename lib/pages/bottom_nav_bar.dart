import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline), label: 'Favorite'),
      BottomNavigationBarItem(
          icon: Icon(Icons.notification_add_outlined), label: 'Notification'),
    ]);
  }
}
