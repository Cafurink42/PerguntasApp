import 'package:flutter/material.dart';
import 'package:projeto_perguntas/main.dart';

class Congrats extends StatelessWidget {
  final String texto;
  final VoidCallback onReset;

  Congrats(this.texto, this.onReset);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: onReset, icon: BackButtonIcon()),
      ),
      body: Center(
        child: Text(
          'Parabéns! Você completou todas as perguntas!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
