import 'package:flutter/material.dart';

//componente Resposta
class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;
  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: SizedBox(
        height: 40,
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: Text(texto),
          onPressed: quandoSelecionado,
        ),
      ),
    );
  }
}
