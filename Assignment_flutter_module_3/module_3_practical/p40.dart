/*
40.Create a custom RatingWidget that displays a series of stars and allows the user to select a 
rating from 1 to 5. 
*/

import 'package:flutter/material.dart';

class myp40 extends StatefulWidget {
  const myp40({super.key});

  @override
  State<myp40> createState() => _myp40State();
}

class _myp40State extends State<myp40> {
int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Rate this product:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1; // Update the rating when a star is tapped
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            Text('Selected Rating: $_rating', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}