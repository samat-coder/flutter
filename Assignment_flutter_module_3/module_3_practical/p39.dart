/*
 39.Implement a simple authentication flow with login and logout, where user status (logged in 
or out) is managed globally using Provider. 
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class myp39 extends StatelessWidget {
  const myp39({super.key});

 @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(authProvider.isLoggedIn ? 'Welcome!' : 'Please Log In'),
        actions: [
          if (authProvider.isLoggedIn)
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                authProvider.logout();
              },
            ),
        ],
      ),
      body: Center(
        child: authProvider.isLoggedIn
            ? const Text('You are logged in!')
            : const LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Please log in to continue'),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            authProvider.login();
          },
          child: const Text('Log In'),
        ),
      ],
    );
  }
}

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  // Simulate logging in
  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  // Simulate logging out
  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}