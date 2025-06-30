/*
28.Design a product listing page using ListView with horizontal scrolling, showing product 
images, names, and prices.
*/
import 'package:flutter/material.dart';

class myp28 extends StatelessWidget {
   myp28({super.key});

  final List<Map<String, String>> products = [
    {
      'name': 'Product 1',
      'price': '\$20',
      'image': 'https://images.pexels.com/photos/905847/pexels-photo-905847.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
    {
      'name': 'Product 2',
      'price': '\$30',
      'image': 'https://images.pexels.com/photos/1093015/pexels-photo-1093015.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
    {
      'name': 'Product 3',
      'price': '\$40',
      'image': 'https://images.pexels.com/photos/28308002/pexels-photo-28308002/free-photo-of-a-pizza-with-greens-and-other-toppings-on-a-table.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
    {
      'name': 'Product 4',
      'price': '\$50',
      'image': 'https://images.pexels.com/photos/12032525/pexels-photo-12032525.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
 
            SizedBox(
              height: 250, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                    
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product['image']!,
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                      
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product['price']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}