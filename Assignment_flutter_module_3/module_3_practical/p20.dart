/*
20.Make a simple task manager app with a form to add tasks. Use CheckboxListTile widgets to 
mark tasks as completed. 
*/

import 'package:flutter/material.dart';

class myp20 extends StatefulWidget {
  const myp20({super.key});

  @override
  State<myp20> createState() => _myp20State();
}

class _myp20State extends State<myp20> {
  final List<Map<String, dynamic>> _tasks = []; // List to store tasks
  final TextEditingController _taskController = TextEditingController(); // Controller for the input field

  // Add a new task to the list
  void _addTask(String task) {
    setState(() {
      _tasks.add({'task': task, 'completed': false});
    });
    _taskController.clear(); // Clear the input field
  }

  // Toggle task completion
  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['completed'] = !_tasks[index]['completed'];
    });
  }

  // Remove a task
  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input field and add button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      hintText: "Enter a task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    if (_taskController.text.trim().isNotEmpty) {
                      _addTask(_taskController.text.trim());
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Task list
            Expanded(
              child: _tasks.isNotEmpty
                  ? ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                          title: Text(
                            _tasks[index]['task'],
                            style: TextStyle(
                              decoration: _tasks[index]['completed']
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          value: _tasks[index]['completed'],
                          onChanged: (value) => _toggleTask(index),
                          secondary: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removeTask(index),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        "No tasks available",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}