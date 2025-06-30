/*
24.Design a bottom navigation bar with three tabs: News, Messages, and Profile. Change the 
displayed content based on the selected tab. 
*/
import 'package:flutter/material.dart';

class myp24 extends StatefulWidget {
  const myp24({super.key});

  @override
  State<myp24> createState() => _myp24State();
}

class _myp24State extends State<myp24> {
  
  int _selectedIndex = 0; // Track the selected tab

  // List of widget content for each tab
  final List<Widget> _widgetOptions = [
    const NewsTab(),
    const MessagesTab(),
    const ProfileTab(),
  ];

  // Handle tab changes
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Navigation Bar"),
        centerTitle: true,
      ),
      body: _widgetOptions[_selectedIndex], // Display content based on selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Current active tab
        onTap: _onItemTapped, // Handle tab selection
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class NewsTab extends StatelessWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'News Content Goes Here',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MessagesTab extends StatelessWidget {
  const MessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Messages Content Goes Here',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Profile Content Goes Here',
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}