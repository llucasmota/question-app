import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import './GeneralButton.dart';

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
      },
      {
        'texto': 'Qual seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
      },
      {
        'texto': 'Qual seu instrutor favorito?',
        'respostas': ['Maria', 'João', 'Leo', 'Pedro']
      }
    ];

    List<String> respostas =
        perguntas[_perguntaSelecionada].cast()['respostas'];
    // for (String textResposta
    //     in perguntas[_perguntaSelecionada].cast()['respostas']) {
    //   respostas.add(GeneralButton(textResposta, _responder));
    // }

    // List<Widget> widgets =
    //     respostas.map((t) => GeneralButton(t, _responder)).toList();

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas'),
      ),
      body: Column(
        children: <Widget>[
          Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
          ...respostas.map((t) => GeneralButton(t, _responder)).toList()
        ],
      ),
    ));
  }
}

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  // @override
  // State<PerguntaApp> createState() => PerguntaAppState();

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
