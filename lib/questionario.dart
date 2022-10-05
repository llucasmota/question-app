import 'package:flutter/material.dart';
import 'package:projeto_perguntas/generalButton.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/result.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  int perguntaSelecionada = 0;
  final void Function() onSelection;

  Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.onSelection});

  bool get haveASelectedAnswer {
    return perguntaSelecionada + 1 <= perguntas.length;
  }

  Widget build(BuildContext context) {
    List<String> respostas = haveASelectedAnswer
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
    return Column(children: <Widget>[
      Questao(perguntas[perguntaSelecionada]['texto'].toString()),
      ...respostas.map((t) => GeneralButton(t, onSelection)).toList()
    ]);
  }
}
