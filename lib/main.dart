import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import 'quizz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What do you like more ?',
      'answers': [
        {'text': 'Baseball', 'score': 10},
        {'text': 'Soccer', 'score': 4},
        {'text': 'Football', 'score': 2}
      ]
    },
    {
      'questionText': 'What color do you prefer ?',
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Grey', 'score': 2},
        {'text': 'Black', 'score': 0}
      ]
    },
    {
      'questionText': 'How many time you go to groceries per week ?',
      'answers': [
        {'text': '1', 'score': 1},
        {'text': '2-3', 'score': 10},
        {'text': '4 or more', 'score': 4}
      ]
    }
  ];

  void _resetQuizz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
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
              ? Quizz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuizz)),
    );
  }
}
