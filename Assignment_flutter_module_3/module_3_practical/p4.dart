/*
4.Make a "Login Screen" with two TextField widgets for email and password inputs, and a 
RaisedButton or ElevatedButton widget for the login button. 
*/
import 'package:flutter/material.dart';

class myp4 extends StatelessWidget {
   myp4({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        backgroundColor: Colors.deepOrange[200],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration:const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
           const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration:const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0), 
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                padding:const EdgeInsets.symmetric(vertical: 22.0),
              ),
              child:const Text(
                'Login',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}