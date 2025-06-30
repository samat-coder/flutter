import 'package:flutter/material.dart';

class myp36_1 extends StatelessWidget {
  const myp36_1({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Go Back to Screen 1'),
        ),
      ),
    );
  }
}
