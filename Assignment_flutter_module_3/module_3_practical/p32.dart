/*
32.Design a custom button with an icon positioned above the text. Use Stack to overlay the 
icon slightly on top of the text.
*/

import 'package:flutter/material.dart';

class myp32 extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const myp32({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.none, // Allows the icon to overflow the container
        alignment: Alignment.center,
        children: [
          // Button background
          Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Icon overlay
          Positioned(
            top: -20,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                icon,
                color: Colors.blueAccent,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
