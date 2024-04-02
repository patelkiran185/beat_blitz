// lib/utils/bottom_navigation.dart
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const BottomNavigationWidget({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_music),
          label: 'My Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow),
          label: 'Play',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      selectedItemColor: Color.fromARGB(255, 44, 12, 12),
      unselectedItemColor: Color.fromARGB(255, 25, 12, 46),
      currentIndex: currentIndex,
      onTap: onTabTapped,
      showUnselectedLabels: true,
      backgroundColor: Colors.blueGrey, 
    );
  }
}
