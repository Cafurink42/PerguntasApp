import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      //valores do tipo Map String e Objeto
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Azul', 'Verde', 'Vermelho', 'Amarelo'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Cachorro', 'Gato', 'Pássaro', 'Peixe'],
      },
      {
        'texto': 'Qual é o seu esporte favorito?',
        'respostas': ['Futebol', 'Basquete', 'Vôlei', 'Natação'],
      },
      {
        'texto': 'Qual é a sua comida favorita?',
        'respostas': ['Pizza', 'Hambúrguer', 'Sushi', 'Salada'],
      },
      {
        'texto': 'Qual é o seu hobby favorito?',
        'respostas': ['Ler', 'Viajar', 'Cozinhar', 'Jogar videogame'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
              Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
              Resposta('Resposta 1', _responder),
              SizedBox(height: 10),
              Resposta('Resposta 2', _responder),
              SizedBox(height: 10),
              Resposta('Resposta 3', _responder),
            ],
          ),
        ),
      ),
    );
  }
}
