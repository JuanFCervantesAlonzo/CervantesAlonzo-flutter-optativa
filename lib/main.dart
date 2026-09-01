import 'package:flutter/material.dart';
import 'package:flutter_application_class/widgets/OperationButtons.dart';
import 'package:flutter_application_class/widgets/MyCustomInput.dart';
import 'package:flutter_application_class/widgets/ResultText.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  double resultado = 0;
  String accion = '';

  void calcular(String operacion) {
    double num1 = double.tryParse(controller1.text) ?? 0;
    double num2 = double.tryParse(controller2.text) ?? 0;

    setState(() {
      accion = operacion;
      switch (operacion) {
        case 'suma':
          resultado = num1 + num2;
          break;
        case 'resta':
          resultado = num1 - num2;
          break;
        case 'multiplicacion':
          resultado = num1 * num2;
          break;
        case 'division':
          resultado = num2 != 0 ? num1 / num2 : 0;
          break;
      }
    });
  }

  void borrar() {
    setState(() {
      controller1.clear();
      controller2.clear();
      resultado = 0;
      accion = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mi Primera App'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text('CALCULADORA', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              ResultText(result: resultado, action: accion),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Mycustomeinput(controller: controller1),
                  const SizedBox(width: 16),
                  Mycustomeinput(controller: controller2),
                ],
              ),
              const SizedBox(height: 16),
              OperationButtons(onOperation: calcular),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: borrar, child: const Text('BORRAR')),
            ],
          ),
        ),
      ),
    );
  }
}