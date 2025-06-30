/*
13.Create an app with an Image widget displaying a picture from the network. Add a button 
below the image to change the image source when pressed.
*/
import 'package:flutter/material.dart';

class myp13 extends StatefulWidget {
  const myp13({super.key});

  @override
  State<myp13> createState() => _myp13State();
}

class _myp13State extends State<myp13> {
 final List<String> _imageUrls = [
    'https://images.pexels.com/photos/29673663/pexels-photo-29673663/free-photo-of-charming-mediterranean-village-street-scene.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/6357538/pexels-photo-6357538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/23720090/pexels-photo-23720090/free-photo-of-tall-uniquely-shaped-apartment-building-flora-panorama-in-burgas-in-bulgaria.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/401975/pexels-photo-401975.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',  ];


  int _currentImageIndex = 0;

 
  void _changeImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % _imageUrls.length; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Image Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         
            Image.network(
              _imageUrls[_currentImageIndex],
              width: 400,  
              height: 300,
              fit: BoxFit.cover, 
            ),
            const SizedBox(height: 20), 
            ElevatedButton(
              onPressed: _changeImage,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Change Image'),
            ),
          ],
        ),
      ),
    );
  }
}
