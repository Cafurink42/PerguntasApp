import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  }); //parametros nomeados e obrigatórios a serem passsados

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  } //verificar se ainda tem alguma pergunta para mostrar

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? (perguntas[perguntaSelecionada]['respostas']
              as List<Map<String, Object>>)
        : [];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Questao(perguntas[perguntaSelecionada]['texto'].toString()),
          ...respostas
              .map((r) => Resposta(r['texto'] as String, responder))
              .toList(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
