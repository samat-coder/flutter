/*
1.Create a simple "Hello World" Flutter app with a Text widget displaying "Hello, Flutter!" 
centered on the screen. 
*/
import 'package:flutter/material.dart';

class myp1 extends StatelessWidget {
  const myp1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("hello world!"),
        backgroundColor: Colors.deepOrange[200],
      ),
      body: const Center(child: Text("hello, flutter!"),),
    );
  }
}