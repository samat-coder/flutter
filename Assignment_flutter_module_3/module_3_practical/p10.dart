/*
10.Create a shopping cart app with a list of items and an "Add to Cart" button for each. When 
the button is pressed, update a counter in the AppBar showing the total items in the cart.
*/

import 'package:flutter/material.dart';

class myp10 extends StatefulWidget {
  const myp10({super.key});

  @override
  State<myp10> createState() => _myp10State();
}

class _myp10State extends State<myp10> {
 int _cartCount = 0; 

  final List<Map<String, String>> _items = [
    {'name': 'Item 1', 'price': '\$10'},
    {'name': 'Item 2', 'price': '\$20'},
    {'name': 'Item 3', 'price': '\$30'},
    {'name': 'Item 4', 'price': '\$40'},
    {'name': 'Item 5', 'price': '\$50'},
  ];

  void _addToCart() {
    setState(() {
      _cartCount++; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                const Icon(Icons.shopping_cart),
                if (_cartCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        '$_cartCount',
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(_items[index]['name']!),
              subtitle: Text(_items[index]['price']!),
              trailing: ElevatedButton(
                onPressed: _addToCart, 
                child: const Text('Add to Cart'),
              ),
            ),
          );
        },
      ),
    );
  }
}