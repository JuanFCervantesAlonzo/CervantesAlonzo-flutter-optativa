import 'package:flutter/material.dart';

class Numberinput2 extends StatefulWidget{

  final TextEditingController inputIzq;
  final TextEditingController inputDer;
  final String labelNumber;
  final FocusNode? inputIzqFocus;
  final FocusNode? inputDerFocus;

  const Numberinput2({
    super.key,
    required this.inputIzq,
    required this.inputDer,
    required this.labelNumber,
    this.inputIzqFocus,
    this.inputDerFocus,
  });

  @override
  State<Numberinput2> createState() => _NumberInput2();
}

class _NumberInput2 extends State<Numberinput2>{

  void setInput(){
    final controller = widget.inputDerFocus?.hasFocus == true
        ? widget.inputDer
        : widget.inputIzq;
    controller.text += widget.labelNumber;
    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: setInput,
      child: Text(
        widget.labelNumber
      )
    );
  }
}