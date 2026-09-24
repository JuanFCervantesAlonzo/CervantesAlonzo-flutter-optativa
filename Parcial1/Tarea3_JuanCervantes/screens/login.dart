import 'package:flutter/material.dart';
import 'package:flutter_application_class/widgets/MyBottomNavigatorBar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyBottomNavigatorBar(),
              ),
            );
          },
          child: const Text("Pantalla 1"),
        ),
      ),
    );
  }
}