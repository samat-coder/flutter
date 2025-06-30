/*
2.Build a Flutter app with an AppBar that has a title and a FloatingActionButton. Use the 
button to increment a counter displayed in the center of the screen.
*/

import 'package:flutter/material.dart';

class myp2 extends StatefulWidget {
  const myp2({super.key});

  @override
  State<myp2> createState() => _myp2State();
}

class _myp2State extends State<myp2> {
  int counter=0;

   void _incrementcounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("counter app"),
        backgroundColor: Colors.deepOrange[200],
      ),
      body: Center(child: Text('$counter'),),

      floatingActionButton:FloatingActionButton(
        onPressed:_incrementcounter,
        child: const Icon(Icons.add), ) ,
    );
  }
}