/*
38.Create a shopping cart where the total price is updated in real-time using Provider as items 
are added or removed
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Item {
  final String name;
  final double price;

  Item({required this.name, required this.price});
}

class CartProvider extends ChangeNotifier {
  final List<Item> _itemsInCart = [];

  List<Item> get items => _itemsInCart;

  double get totalPrice =>
      _itemsInCart.fold(0, (sum, item) => sum + item.price);

  void addItem(Item item) {
    _itemsInCart.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _itemsInCart.remove(item);
    notifyListeners();
  }
}

// Main myp38
class myp38 extends StatelessWidget {
  final List<Item> availableItems = [
    Item(name: 'Apple', price: 1.5),
    Item(name: 'Banana', price: 0.8),
    Item(name: 'Orange', price: 1.2),
    Item(name: 'Grapes', price: 2.0),
  ];

   myp38({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<CartProvider>(
              builder: (context, cart, child) => Center(
                child: Text(
                  'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: availableItems.length,
              itemBuilder: (context, index) {
                final item = availableItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      context.read<CartProvider>().addItem(item);
                    },
                    child: const Text('Add'),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cart, child) => cart.items.isEmpty
                  ? const Center(child: Text('No items in cart'))
                  : ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () {
                              context.read<CartProvider>().removeItem(item);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}