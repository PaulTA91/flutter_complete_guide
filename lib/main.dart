import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  static const questions = [
    {
      'questionText': "What's your favourite colour?",
      'answers': ['Red', 'Blue', 'Purple', 'Green']
    },
    {
      'questionText': "What's your favourite animal?",
      'answers': ['Dog', 'Cat', 'Giraffe', 'Shark']
    },
    {
      'questionText': "What's your favourite food?",
      'answers': ['Borgor', 'Pasta', 'Ice Cream', 'Pizza']
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
      print(_questionIndex);
      if (_questionIndex < questions.length) {
        print('We have more questions');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
