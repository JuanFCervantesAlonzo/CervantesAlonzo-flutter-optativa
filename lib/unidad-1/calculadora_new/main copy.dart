import 'package:flutter/material.dart';
import 'package:flutter_application_class/unidad-1/calculadora_new/ActionButton2.dart';
import 'package:flutter_application_class/unidad-1/calculadora_new/Input2.dart';
import 'package:flutter_application_class/unidad-1/calculadora_new/NumberInput2.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      routes: {
        
      },
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final inputIzq = TextEditingController();
  final inputDer = TextEditingController();
  final inputRespuesta = TextEditingController();
  final inputIzqFocus = FocusNode();
  final inputDerFocus = FocusNode();

  @override
  void dispose() {
    inputIzq.dispose();
    inputDer.dispose();
    inputRespuesta.dispose();
    inputIzqFocus.dispose();
    inputDerFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body:    SingleChildScrollView(
                padding:  const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children:[
                        Expanded(
                          child: Input2(
                            input: inputIzq,
                            focusNode: inputIzqFocus,
                            labelText: "Input Izq",
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Input2(
                            input: inputDer,
                            focusNode: inputDerFocus,
                            labelText: "Input Der",
                          ),
                        ),
                      ]
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: Input2(input: inputRespuesta, labelText: "Input Respuesta",readOnly: true),
                    ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Numberinput2(inputIzq: inputIzq, inputDer: inputDer, inputIzqFocus: inputIzqFocus, inputDerFocus: inputDerFocus, labelNumber: "1"),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Numberinput2(inputIzq: inputIzq, inputDer: inputDer, inputIzqFocus: inputIzqFocus, inputDerFocus: inputDerFocus, labelNumber: "2"),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Numberinput2(inputIzq: inputIzq, inputDer: inputDer, inputIzqFocus: inputIzqFocus, inputDerFocus: inputDerFocus, labelNumber: "3"),
                      ),

                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Numberinput2(inputIzq: inputIzq, inputDer: inputDer, inputIzqFocus: inputIzqFocus, inputDerFocus: inputDerFocus, labelNumber: "4"),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Numberinput2(inputIzq: inputIzq, inputDer: inputDer, inputIzqFocus: inputIzqFocus, inputDerFocus: inputDerFocus, labelNumber: "5"),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Numberinput2(inputIzq: inputIzq, inputDer: inputDer, inputIzqFocus: inputIzqFocus, inputDerFocus: inputDerFocus, labelNumber: "6"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: Numberinput2(inputIzq: inputIzq, inputDer: inputDer, inputIzqFocus: inputIzqFocus, inputDerFocus: inputDerFocus, labelNumber: "7"),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Numberinput2(inputIzq: inputIzq, inputDer: inputDer, inputIzqFocus: inputIzqFocus, inputDerFocus: inputDerFocus, labelNumber: "8"),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Numberinput2(inputIzq: inputIzq, inputDer: inputDer, inputIzqFocus: inputIzqFocus, inputDerFocus: inputDerFocus, labelNumber: "9"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [ 
                      Expanded(
                        child: Numberinput2(inputIzq: inputIzq, inputDer: inputDer, inputIzqFocus: inputIzqFocus, inputDerFocus: inputDerFocus, labelNumber: "0"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      for (final operation in ["+", "-", "*", "/"])
                        Actionbutton2(
                          inputIzq: inputIzq,
                          inputDer: inputDer,
                          inputRespuesta: inputRespuesta,
                          labelAction: operation,
                        ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  Center(
                    child: Actionbutton2(
                      inputIzq: inputIzq,
                     inputDer: inputDer, 
                     inputRespuesta: inputRespuesta,
                      labelAction: "CLEAR"
                      ),
                  )
                  ]
                ),
                ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            Container(
                color: Colors.blue,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 50.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                )),
            const ListTile(
              title: Text('Item 1'),
            ),
            const ListTile(
              title: Text('Item 2'),
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ));
  }
}
 