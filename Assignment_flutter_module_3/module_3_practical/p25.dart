/*
25.Create an infinite scrolling list using ListView.builder that loads more data as the user scrolls 
to the bottom. 
*/
import 'package:flutter/material.dart';

class myp25 extends StatefulWidget {
  const myp25({super.key});

  @override
  State<myp25> createState() => _myp25State();
}

class _myp25State extends State<myp25> {
  final List<String> _items = List.generate(20, (index) => 'Item #$index');
  bool _isLoading = false; 
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }
  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      if (!_isLoading) {
        _loadMoreData(); 
      }
    }
  }

  
  Future<void> _loadMoreData() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    await Future.delayed(const Duration(seconds: 2)); // Simulate a delay

    final newItems = List.generate(20, (index) => 'Item #${_items.length + index}');
    setState(() {
      _items.addAll(newItems); // Add more items to the list
      _isLoading = false; // Hide loading indicator
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Infinite Scroll List")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + 1, // Add one extra for the loading indicator
        itemBuilder: (context, index) {
          if (index == _items.length) {
            // Show loading indicator at the bottom when new data is being fetched
            return _isLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink(); // Empty widget if no loading
          }
          return ListTile(
            title: Text(_items[index]),
          );
        },
      ),
    );
  }
}
