import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import './GeneralButton.dart';

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
    print('$_perguntaSelecionada ${_perguntas.length}');
    return _perguntaSelecionada + 1 <= _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = haveASelectedAnswer
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];
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
      body: haveASelectedAnswer
          ? Column(
              children: <Widget>[
                Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                ...respostas.map((t) => GeneralButton(t, _responder)).toList()
              ],
            )
          : null,
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
