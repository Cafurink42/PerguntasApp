import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './parabens.dart';

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
      'respostas': ['Ler', 'Viajar', 'Cozinhar', 'Jogar video game'],
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

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }
  //bool get temPerguntaSelecionada {
  //  return _perguntaSelecionada < perguntas.length;
  //}

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? (_perguntas[_perguntaSelecionada]['respostas'] as List<String>)
        : [];
    List<Widget> widgets = respostas
        .map(
          (r) => Resposta(r, _responder),
        ) //Para cada item t ele cria uma novo widget do tipo Resposta passando dois argumentos t: o próprio item da lista e
        //_responder uma função que será chamado quando algo for acionado nesse widget.
        .toList(); //transforma o resuldo do .map() que é um Iterable em uma lista.

    //for (String textResp in respostas) {
    //  //cast é usado para converter o tipo dinâmico para o tipo específico
    //  widgets.add(Resposta(textResp, _responder));
    //  print(textResp);
    //}

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
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Questao(
                      _perguntas[_perguntaSelecionada]['texto'].toString(),
                    ),
                    ...respostas.map((r) => Resposta(r, _responder)).toList(),
                    SizedBox(height: 10),
                  ],
                ),
              )
            : Congrats(
                'Parabéns! Você completou todas as perguntas!',
                _reinciarQuestionario,
              ),
      ),
    );
  }
}
