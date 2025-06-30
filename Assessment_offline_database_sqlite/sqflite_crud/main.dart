import 'package:flutter/material.dart';
import 'package:sqflitedemo/exam/e_add_screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myaddscreen1(),
    );
  }
}
