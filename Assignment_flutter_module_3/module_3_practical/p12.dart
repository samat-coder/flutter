/*
12.Make a toggle switch that changes the app’s background color when turned on or off. Use 
the 
Switch widget to handle the toggle state. 
*/
import 'package:flutter/material.dart';

class myp12 extends StatefulWidget {
  const myp12({super.key});

  @override
  State<myp12> createState() => _myp12State();
}

class _myp12State extends State<myp12> {
  bool _isSwitched = false; 
  Color _backgroundColor = Colors.white; 

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value; 
      _backgroundColor = _isSwitched ? Colors.blue : Colors.white; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toggle Switch Background Color'),
        centerTitle: true,
      ),
      body: Container(
        color: _backgroundColor, 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           
              Switch(
                value: _isSwitched,
                onChanged: _toggleSwitch,
                activeColor: Colors.green, 
                inactiveThumbColor: Colors.red,  
                inactiveTrackColor: Colors.grey, 
              ),
            
              Text(
                _isSwitched ? 'Switch is ON' : 'Switch is OFF',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _isSwitched ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}