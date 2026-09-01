import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  

  final TextEditingController _controller = TextEditingController();
  String _inputValue = ''; 

    setStateInput() {
    setState(() {
      String inputText = _controller.text.trim();
      
      if(_controller.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor ingresa un valor'),
          backgroundColor: Colors.red,
          duration:  Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
      }
      _inputValue = _controller.text;
    });
  }

  setStateClear() {
    setState(() {
      _controller.clear();
      _inputValue = '';
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      TextFormField(
        controller: _controller,
        decoration: const InputDecoration(
          labelText: 'Enter your name',
        ),
      ),

      ElevatedButton(
        onPressed: setStateInput,
        child: const Text("Guardar"),
      ),

      ElevatedButton.icon(
        onPressed: setStateClear,
        icon: const Icon(Icons.clear),
        label: const Text("Limpiar"),
      ),
      Text("Valor ingresado: $_inputValue"),
    ]);
  }
} 