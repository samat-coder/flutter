import 'package:flutter/material.dart';
import 'package:foodzone/1_add_item.dart';

class my_screen extends StatelessWidget {
  const my_screen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
          appBar: AppBar(
            title: const Text("food zone"),
            backgroundColor: Colors.orangeAccent,
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'images/salad2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                  child: Container(
                color: Colors.black.withOpacity(0.5),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "healthy food\nis good",
                        style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "more then 10000 recipes\nfor everyday and taste",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const myadditem1()),
                      );
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 70),
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            child: const Text(
                              "let's started",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                      )),
                ],
              ),
            ],
          ));
    
  }
}
