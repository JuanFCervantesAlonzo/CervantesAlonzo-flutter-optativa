import 'package:flutter/material.dart';
import 'package:flutter_application_class/screens/Pantalla1.dart';
import 'package:flutter_application_class/screens/home_screen.dart';
import 'package:flutter_application_class/screens/calculator_screen.dart';
import 'package:flutter_application_class/widgets/product_card.dart';

class MyBottomNavigatorBar extends StatefulWidget {
  const MyBottomNavigatorBar({super.key});

  @override
  State<MyBottomNavigatorBar> createState() => _MyBottomNavigatorBarState();
}

class _MyBottomNavigatorBarState extends State<MyBottomNavigatorBar> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    Pantalla1(),
    CalculatorScreen(),
    Center(
      child: Text(
        'Pantalla 3',
        style: TextStyle(fontSize: 24),
      ),
    ),
  ];

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calculate),
      label: 'Calculadora',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.info),
      label: 'Pantalla 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: items,
      ),
    );
  }
}