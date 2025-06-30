/*
8.Create a screen with ListView.builder to display a list of names. When tapped, each name 
should print "Name tapped" in the console.
*/
import 'package:flutter/material.dart';

class myp8 extends StatelessWidget {
 myp8({super.key});
 final List<String> names = [
    'rajesh',
    'ram',
    'sameer',
    'karan',
    'bharat',
    'aman',
    'raju',
    'dhruv',
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nname list'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
            onTap: () {
              // Print message to console
              print('${names[index]} tapped');
            },
          );
        },
      ),
    );
  }
}