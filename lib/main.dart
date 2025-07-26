import 'package:flutter/material.dart';
import './questao.dart';

main() {
  runApp(PerguntaApp());
}

//Criação do primeiro Widget Flutter
class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  //Criação do método responder
  void _responder() {
    //o método setState é o responsável por atualizar o estado do widget.
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
      'Qual é o seu esporte favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Questao(perguntas[_perguntaSelecionada]),
              ElevatedButton(child: Text('Resposta 1'), onPressed: _responder),
              ElevatedButton(child: Text('Resposta 2'), onPressed: _responder),
              ElevatedButton(child: Text('Resposta 3'), onPressed: _responder),
            ],
          ),
        ),
      ),
    );
  }
}
