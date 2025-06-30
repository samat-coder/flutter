/*
5.Create a responsive layout using a Row widget with three Container widgets, each with 
different background colors and widths. 
*/
import 'package:flutter/material.dart';

class myp5 extends StatelessWidget {
  const myp5({super.key});

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Row Layout'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double totalWidth = constraints.maxWidth;
          
          double firstWidth = totalWidth * 0.3; 
          double secondWidth = totalWidth * 0.4;
          double thirdWidth = totalWidth * 0.3;

          return Row(
            children: [
              Container(
                width: firstWidth,
                height: 100,
                color: Colors.red,
                child: const Center(child: Text('30%', style: TextStyle(color: Colors.white))),
              ),
              Container(
                width: secondWidth,
                height: 100,
                color: Colors.green,
                child: const Center(child: Text('40%', style: TextStyle(color: Colors.white))),
              ),
              Container(
                width: thirdWidth,
                height: 100,
                color: Colors.blue,
                child: const Center(child: Text('30%', style: TextStyle(color: Colors.white))),
              ),
            ],
          );
        },
      ),
    );
  }
}