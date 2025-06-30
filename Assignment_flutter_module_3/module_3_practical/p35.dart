/*
35.Make a button with a pulsing effect using TweenAnimationBuilder to change the button 
size. 
*/
import 'package:flutter/material.dart';

class myp35 extends StatefulWidget {
  const myp35({super.key});

  @override
  State<myp35> createState() => _myp35State();
}

class _myp35State extends State<myp35> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsing Button'),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 1.0, end: 1.2),
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          builder: (context, scale, child) {
            return Transform.scale(
              scale: scale,
              child: child,
            );
          },
          onEnd: () {
            setState(() {});
          },
          child: ElevatedButton(
            onPressed: () {
              print('Button Pressed');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child:const Text(
              'Pulse',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}