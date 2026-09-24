import 'package:flutter/material.dart';

import '../widgets/app_header.dart';
import 'calculator_screen.dart';
import 'options_screen.dart';
import 'product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _quantity = 5;

  void _navigateTo(int index) {
    setState(() => _currentIndex = index);
  }

  void _addProduct() {
    setState(() => _quantity++);
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const CalculatorScreen(),
      const OptionsScreen(),
      ProductScreen(quantity: _quantity, onAdd: _addProduct),
    ];

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppHeader(
                    currentIndex: _currentIndex,
                    onNavigate: _navigateTo,
                  ),
                  const SizedBox(height: 36),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 220),
                    child: KeyedSubtree(
                      key: ValueKey(_currentIndex),
                      child: screens[_currentIndex],
                    ),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    'Una interfaz sencilla para practicar componentes reutilizables.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
