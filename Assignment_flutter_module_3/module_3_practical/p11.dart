/*
11.Design a counter app with increment and decrement buttons. Use setState to update the 
displayed value as the buttons are pressed.
*/
import 'package:flutter/material.dart';

class myp11 extends StatefulWidget {
  const myp11({super.key});

  @override
  State<myp11> createState() => _myp11State();
}

class _myp11State extends State<myp11> {
  int _counter = 0;  // The counter variable

  // Function to increment the counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Function to decrement the counter
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the counter value
            Text(
              'Counter: $_counter',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            // Row with buttons to increment and decrement
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrement button
                ElevatedButton(
                  onPressed: _decrementCounter,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(width: 20),
                // Increment button
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}