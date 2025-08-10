import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import './questionario.dart';
import './resultado.dart';

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
  final List<Map<String, Object>> _perguntas = const [
    //valores do tipo Map String e Objeto
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'nota': 7},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Vermelho', 'nota': 0},
        {'texto': 'Amarelo', 'nota': 4},
      ],
    },
    {
      'texto': 'Qual é o seu esporte favorito?',
      'respostas': [
        {'texto': 'Futebol', 'nota': 6},
        {'texto': 'Basquete', 'nota': 3},
        {'texto': 'Vôlei', 'nota': 8},
        {'texto': 'Natação', 'nota': 2},
      ],
    },
    {
      'texto': 'Qual é a sua comida favorita?',
      'respostas': [
        {'texto': 'Pizza', 'nota': 6},
        {'texto': 'Hambúrguer', 'nota': 6},
        {'texto': 'Sushi', 'nota': 8},
        {'texto': 'Salada', 'nota': 2},
      ],
    },
    {
      'texto': 'Qual é o seu hobby favorito?',
      'respostas': [
        {'texto': 'Ler', 'nota': 4},
        {'texto': 'Viajar', 'nota': 6},
        {'texto': 'Cozinhar', 'nota': 8},
        {'texto': 'Jogar video game', 'nota': 2},
      ],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
    //o método setState é o responsável por atualizar o estado do widget.
  }

  void _reinciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
    });
  }

  //bool get temPerguntaSelecionada {
  //  return _perguntaSelecionada < perguntas.length;
  //}

  //verifica se ainda tem alguma pergunta para mostrar
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text('Perguntas'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),

        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Congrats('', _reinciarQuestionario),
      ),
    );
  }
}
