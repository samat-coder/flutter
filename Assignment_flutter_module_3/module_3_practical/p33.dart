/*
33.Add a fade-in animation to an image using FadeInImage when it’s loaded from a network 
source. 
*/
import 'package:flutter/material.dart';

class myp33 extends StatelessWidget {
  const myp33({super.key});

   @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: 'images/backg.jpg',
      image: 'https://images.pexels.com/photos/949587/pexels-photo-949587.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      fadeInDuration: const Duration(seconds: 2), 
      fit: BoxFit.cover,
      width: 300,
      height: 300,
    );
  }
}