/*
19.Design a search bar using TextField and display suggestions below as the user types. Filter 
suggestions based on input. 
*/
import 'package:flutter/material.dart';

class myp19 extends StatelessWidget {
  const myp19({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchBarDemo(),
    );
  }
}

class SearchBarDemo extends StatefulWidget {
  const SearchBarDemo({super.key});

  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];
  final List<String> _allItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Grapes',
    'Honeydew',
    'Kiwi',
    'Lemon',
    'Mango',
    'Orange',
    'Pineapple',
    'Strawberry',
    'Watermelon',
  ];
  void _filterSuggestions(String query) {
    setState(() {
      if (query.isEmpty) {
        _suggestions = [];
      } else {
        _suggestions = _allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Bar Example"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search TextField
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search items...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: _filterSuggestions, 
            ),
            const SizedBox(height: 16.0),

            // Suggestions List
            Expanded(
              child: _suggestions.isNotEmpty
                  ? ListView.builder(
                      itemCount: _suggestions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_suggestions[index]),
                          onTap: () {
                           
                            _searchController.text = _suggestions[index];
                            _filterSuggestions('');
                          },
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        "No suggestions available",
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