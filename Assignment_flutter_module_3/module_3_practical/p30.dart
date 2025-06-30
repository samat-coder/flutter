/*
30.Build a basic profile page where the profile image is centered on the screen using 
Positioned inside a Stack, and other details (like name and bio) are displayed below. 
*/
import 'package:flutter/material.dart';

class myp30 extends StatelessWidget {
  const myp30({super.key});

   @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blueAccent.shade100,
        ),
       const Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Replace with your profile image URL
            ),
          ),
        ),
        Positioned(
          top: 260,
          left: 20,
          right: 20,
          child: Column(
            children: [
             const Text(
                'karan',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
             const SizedBox(height: 10),
              const Text(
                'Flutter Developer | Tech Enthusiast',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
             const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                },
                child:const Text('Follow'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}