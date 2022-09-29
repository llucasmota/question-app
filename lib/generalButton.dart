import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String texto;
  final void Function() onSelection;

  GeneralButton(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onSelection,
          child: Text(texto),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, onPrimary: Colors.white),
        ));
  }
}
