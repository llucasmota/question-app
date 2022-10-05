import 'package:flutter/material.dart';
import './result.dart';

import './questionario.dart';

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  void _responder() {
    if (haveASelectedAnswer) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  final _perguntas = const [
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

  bool get haveASelectedAnswer {
    return _perguntaSelecionada + 1 <= _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = haveASelectedAnswer
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Perguntas'),
            ),
            body: haveASelectedAnswer
                ? Questionario(
                    perguntas: _perguntas,
                    perguntaSelecionada: _perguntaSelecionada,
                    onSelection: _responder)
                : Result()));
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
