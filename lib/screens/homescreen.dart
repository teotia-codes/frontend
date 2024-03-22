import 'package:flutter/material.dart';
import 'package:frontend/screens/detail.dart';
import 'package:frontend/screens/profile.dart';
import 'package:frontend/screens/update.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;
final List<Widget> _screens = [
    const ProfileScreen(),
    const UpdateScreen(),
    const AddDetailScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,  // Customize color
          unselectedItemColor: Colors.grey,  // Customize color
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Update',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
          ],
        ),
        body:  _screens[_currentIndex], 
      );
  }
}