/*
26.Build a to-do list app where users can add tasks. Use ListView.builder to display the list of 
tasks and allow each task to be removed with a swipe gesture.
*/
import 'package:flutter/material.dart';

class myp26 extends StatefulWidget {
  const myp26({super.key});

  @override
  State<myp26> createState() => _myp26State();
}

class _myp26State extends State<myp26> {
  final List<String> _tasks = []; // List to store tasks
  final TextEditingController _controller = TextEditingController(); // Controller for text input

  // Function to add task to the list
  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text); // Add the task to the list
        _controller.clear(); // Clear the input field
      });
    }
  }

  // Function to remove task
  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index); // Remove the task at the specified index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Text input to add task
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter task...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _addTask,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          // Display tasks using ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(_tasks[index]),
                  direction: DismissDirection.endToStart, // Swipe to remove
                  onDismissed: (direction) {
                    String removedTask = _tasks[index]; // Store the task to show in SnackBar
                    _removeTask(index); // Remove task when swiped
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Task "$removedTask" removed')),
                    );
                  },
                  child: ListTile(
                    title: Text(_tasks[index]),
                    tileColor: index.isEven ? Colors.lightBlue[50] : Colors.white,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
