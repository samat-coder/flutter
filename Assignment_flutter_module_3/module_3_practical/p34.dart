/*
34.Create a button that, when pressed, expands or collapses a section of content using the 
AnimatedContainer widget. 
*/
import 'package:flutter/material.dart';

class myp34 extends StatefulWidget {
  const myp34({super.key});

  @override
  State<myp34> createState() => _myp34State();
}

class _myp34State extends State<myp34> {
   bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded; 
            });
          },
          child: const Text('Expand / Collapse'),
        ),
        const SizedBox(height: 20),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          width: 300,
          height: _isExpanded ? 200 : 50, 
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: _isExpanded
              ? const Text(
                  'This is the expanded content!',
                  style: TextStyle(color: Colors.white),
                )
              : const Text(
                  'Collapsed content',
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ],
    );
  }
}