/*
15.Add an Image.asset widget to display an image from your local assets folder. Experiment 
with different BoxFit properties like cover, contain, and fill.
*/

import 'package:flutter/material.dart';

class myp15 extends StatelessWidget {
  const myp15({super.key});

    @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageBoxFitExample(),
    );
  }
}

class ImageBoxFitExample extends StatefulWidget {
  const ImageBoxFitExample({super.key});

  @override
  _ImageBoxFitExampleState createState() => _ImageBoxFitExampleState();
}

class _ImageBoxFitExampleState extends State<ImageBoxFitExample> {
  // List of BoxFit options
  final List<BoxFit> _boxFitOptions = [
    BoxFit.cover,
    BoxFit.contain,
    BoxFit.fill,
    BoxFit.fitHeight,
    BoxFit.fitWidth,
    BoxFit.none,
    BoxFit.scaleDown,
  ];

  // Current BoxFit option index
  int _currentBoxFitIndex = 0;


  void _changeBoxFit() {
    setState(() {
      _currentBoxFitIndex = (_currentBoxFitIndex + 1) % _boxFitOptions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image BoxFit Experiment'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              color: Colors.grey[300],
              child: Image.asset(
                'images/backg.jpg',
                fit: _boxFitOptions[_currentBoxFitIndex],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Current BoxFit: ${_boxFitOptions[_currentBoxFitIndex].toString().split('.').last}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          ElevatedButton(
            onPressed: _changeBoxFit,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text('Change BoxFit'),
          ),
        ],
      ),
    );
  }
}
