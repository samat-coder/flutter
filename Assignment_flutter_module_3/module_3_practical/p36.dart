/*
36.Implement a slide transition when navigating between two screens using the 
PageRouteBuilder with custom transition animations.
*/
import 'package:flutter/material.dart';
import 'package:myassignment/flutter_assignment/p36_1.dart';

class myp36 extends StatelessWidget {
  const myp36({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_customPageRoute(const myp36_1()));
          },
          child: const Text('Go to Screen 2'),
        ),
      ),
    );
  }
}
PageRouteBuilder _customPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); 
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}