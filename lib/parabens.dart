import 'package:flutter/material.dart';
import 'package:projeto_perguntas/main.dart';

class Congrats extends StatelessWidget {
  final String texto;
  final VoidCallback onReset;

  Congrats(this.texto, this.onReset);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Center(
        child: ElevatedButton(onPressed: onReset, child: Text('Voltar')),
      ),
    );
  }
}
