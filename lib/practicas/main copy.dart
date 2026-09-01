import 'package:flutter/material.dart';
import 'package:flutter_application_class/practicas/MyButtonState.dart';
import 'package:flutter_application_class/practicas/MyCustomInput.dart';
import 'package:flutter_application_class/practicas/MyForm.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Mi app"),
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              Mycustomeinput(text: "Escribe", read: false),

              SizedBox(height: 20),

              Mycustomeinput(text: "Hola2", read: true),

              SizedBox(height: 20),

              MyButtonState(),

              MyForm(),
            ],
          ),
        ),
      ),
    );
  }
}