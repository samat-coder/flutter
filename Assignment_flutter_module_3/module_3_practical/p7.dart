/*
7.Build a grid of images using the GridView widget. Load images from the network, and 
display four images per row. 
*/
import 'package:flutter/material.dart';

class myp7 extends StatelessWidget {
  myp7({super.key});
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/29673663/pexels-photo-29673663/free-photo-of-charming-mediterranean-village-street-scene.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/6357538/pexels-photo-6357538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/23720090/pexels-photo-23720090/free-photo-of-tall-uniquely-shaped-apartment-building-flora-panorama-in-burgas-in-bulgaria.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/401975/pexels-photo-401975.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/25033118/pexels-photo-25033118/free-photo-of-block-of-flats-in-city.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/29551243/pexels-photo-29551243/free-photo-of-monochrome-ferris-wheel-in-gothenburg-park.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/29587231/pexels-photo-29587231/free-photo-of-silhouette-of-a-person-on-a-bench-in-gothenburg.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/29459200/pexels-photo-29459200/free-photo-of-karla-tower-high-rise-in-gothenburg-s-skyline.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Grid'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Number of images per row
            crossAxisSpacing: 8.0, // Spacing between columns
            mainAxisSpacing: 8.0, // Spacing between rows
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}