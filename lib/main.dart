import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AlumnoForm(),
    );
  }
}

class AlumnoForm extends StatefulWidget {
  const AlumnoForm({super.key});

  @override
  State<AlumnoForm> createState() => _AlumnoFormState();
}

class _AlumnoFormState extends State<AlumnoForm> {
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    apellidoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MI PRIMERA APP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'FORMULARIO DE ALUMNO',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'NOMBRE',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: apellidoController,
              decoration: const InputDecoration(
                labelText: 'APELLIDO',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                debugPrint('${nombreController.text} ${apellidoController.text}');
              },
              child: const Text('GUARDAR'),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIcon(Icons.star),
                _buildIcon(Icons.favorite),
                _buildIcon(Icons.settings),
              ],
            ),
            const SizedBox(height: 24),

            const Text('ESTA ES MI IMAGEN'),
            const SizedBox(height: 8),

            Container(
              width: 250,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('IMAGEN')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon),
    );
  }
}
