import 'package:flutter/material.dart';

main() {
  runApp(PerguntaApp());
}

//Criação do primeiro Widget Flutter
class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
      'Qual é o seu esporte favorito?',
    ];

    //int perguntaSelecionada = 0;
    void start_Pergunta() async {}

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
              Text(perguntas[2]),
              ElevatedButton(child: Text('Resposta 1'), onPressed: null),
              ElevatedButton(child: Text('Resposta 2'), onPressed: null),
              ElevatedButton(child: Text('Resposta 3'), onPressed: null),
            ],
          ),
        ),
      ),
    );
  }
}
