import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  static const _questions = [
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
      if (_questionIndex < _questions.length) {
        print('We have more questions');
      } else {
        print("No more questions");
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
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(),
      ),
    );
  }
}
