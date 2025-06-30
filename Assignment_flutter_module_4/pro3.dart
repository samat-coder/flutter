import 'package:flutter/material.dart';

class mypro3 extends StatefulWidget {
  const mypro3({super.key});

  @override
  State<mypro3> createState() => _mypro3State();
}

class _mypro3State extends State<mypro3> {
   int _selectedIndex = 0;

  final List<Widget> _screens = [
    const Center(child: Text('Welcome to Home Page')),
    const Center(child: Text('Welcome to Profile Page')),
    const Center(child: Text('Welcome to Settings Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar App'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
