/*
3.Create an app with two Text widgets. Apply different TextStyle properties (like font size, 
color, and weight) to each widget to explore styling options.
*/

import 'package:flutter/material.dart';

class myp3 extends StatelessWidget {
  const myp3({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('text styling demo'),
        backgroundColor: Colors.deepOrange[200],
        centerTitle: true,
      ),
      body:const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'bold and large Text',
              style: TextStyle(
                fontSize: 32.0, 
                fontWeight: FontWeight.bold,   
                color: Colors.blue,   
              ),
            ),
            SizedBox(height: 20.0),     
            Text(
              'italic text',
              style: TextStyle(
                fontSize: 24.0,   
                fontStyle: FontStyle.italic,
                color: Colors.green,   
              ),
            ),
          ],
        ),
      ),
    );
  }
}