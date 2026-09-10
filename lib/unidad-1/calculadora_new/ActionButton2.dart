import 'package:flutter/material.dart';

class Actionbutton2 extends StatefulWidget{

  final TextEditingController inputIzq;
  final TextEditingController inputDer;
  final TextEditingController inputRespuesta;
  final String labelAction;

  const Actionbutton2({
    super.key, 
    required this.inputIzq, 
    required this.inputDer, 
    required this.inputRespuesta, 
    required this.labelAction
  });

  @override
  State<Actionbutton2> createState() => _ActionButton();
}

class _ActionButton extends State<Actionbutton2> {

  void setAction(){
    if(widget.labelAction == "CLEAR"){
      widget.inputIzq.text = "";
      widget.inputDer.text = "";
      widget.inputRespuesta.text = "";
      return;
    }

    final inputIzq = double.tryParse(widget.inputIzq.text);
    final inputDer = double.tryParse(widget.inputDer.text);
    if (inputIzq == null || inputDer == null) {
      widget.inputRespuesta.text = "Ingresa dos números";
      return;
    }

    double? result;
    switch (widget.labelAction) {
      case "+":
        result = inputIzq + inputDer;
      case "-":
        result = inputIzq - inputDer;
      case "*":
        result = inputIzq * inputDer;
      case "/":
        if (inputDer != 0) {
          result = inputIzq / inputDer;
        }
    }

    widget.inputRespuesta.text = result == null
        ? "No se puede dividir entre 0"
        : result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: setAction, 
      child: Text(
        widget.labelAction,
      )
    );
  }
}