import 'package:flutter/material.dart';
import 'package:projeto_perguntas/generalButton.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/result.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  int perguntaSelecionada = 0;
  final void Function(int) onSelection;

  Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.onSelection});

  bool get haveASelectedAnswer {
    return perguntaSelecionada + 1 <= perguntas.length;
  }

  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = haveASelectedAnswer
        ? perguntas[perguntaSelecionada].cast()['respostas']
            as List<Map<String, Object>>
        : [];
    return Column(children: <Widget>[
      Questao(perguntas[perguntaSelecionada]['texto'].toString()),
      ...respostas
          .map((resp) => GeneralButton(resp['texto'] as String,
              () => onSelection(int.parse(resp['pontuacao'].toString()))))
          .toList()
    ]);
  }
}
