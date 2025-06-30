/*
*/
import 'package:flutter/material.dart';

class myp27 extends StatefulWidget {
  const myp27({super.key});

  @override
  State<myp27> createState() => _myp27State();
}

class _myp27State extends State<myp27> {
  
  final List<String> _tasks = ['Task 1', 'Task 2', 'Task 3'];

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Styled List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: const Icon(
                Icons.check_circle_outline, 
                color: Colors.blue,
              ),
              title: Text(
                _tasks[index], 
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red), 
                onPressed: () => _removeTask(index),
              ),
              onTap: () {
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You tapped on "${_tasks[index]}"')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}