/*
14.Develop a photo gallery app using GridView to display multiple images from URLs. Include a 
loading indicator while images are loading. 
*/

import 'package:flutter/material.dart';

class myp14 extends StatefulWidget {
  const myp14({super.key});

  @override
  State<myp14> createState() => _myp14State();
}

class _myp14State extends State<myp14> {
  final List<String> _imageUrls = [
    'https://images.pexels.com/photos/29673663/pexels-photo-29673663/free-photo-of-charming-mediterranean-village-street-scene.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/6357538/pexels-photo-6357538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/23720090/pexels-photo-23720090/free-photo-of-tall-uniquely-shaped-apartment-building-flora-panorama-in-burgas-in-bulgaria.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/401975/pexels-photo-401975.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 
 ];

   bool _isLoading = true;

 
  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false; 
    });
  }

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0, 
              ),
              padding: const EdgeInsets.all(8.0),
              itemCount: _imageUrls.length,
              itemBuilder: (context, index) {
                return GridTile(
                  child: Image.network(
                    _imageUrls[index],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                     
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                );
              },
            ),
    );
  }
}