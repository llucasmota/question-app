import 'package:flutter/material.dart';
import './result.dart';

import './questionario.dart';

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (haveASelectedAnswer) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'pontuacao': 1, 'texto': 'Preto'},
        {'pontuacao': 3, 'texto': 'Vermelho'},
        {'pontuacao': 5, 'texto': 'Verde'},
        {'pontuacao': 10, 'texto': 'Branco'}
      ]
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 1},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 5},
        {'texto': 'Leão', 'pontuacao': 4}
      ]
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'respostas': [
        {'pontuacao': 1, 'texto': 'Maria'},
        {'pontuacao': 3, 'texto': 'João'},
        {'pontuacao': 5, 'texto': 'Leo'},
        {'pontuacao': 9, 'texto': 'Pedro'}
      ]
    }
  ];

  bool get haveASelectedAnswer {
    return _perguntaSelecionada + 1 <= _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
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
                : Result(_pontuacaoTotal)));
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
