import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var _questions = const [
      {
        'question': "What's your favorite color?",
        'answer': [
          {'text': 'black', 'score': 4},
          {'text': 'red', 'score': 5},
          {'text': 'green', 'score': 5}
        ]
      },
      {
        'question': "What's your favorite Animal?",
        'answer': [
          {'text': 'Rabit', 'score': 6},
          {'text': 'Snake', 'score': 7},
          {'text': 'elephant', 'score': 3},
          {'text': 'Lion', 'score': 8}
        ]
      },
      {
        'question': "What's your favorite Instructor?",
        'answer': [
          {'text': 'Max', 'score': 5},
          {'text': 'Max', 'score': 6},
          {'text': 'Max', 'score': 4},
          {'text': 'MAX', 'score': 3}
        ]
      },
      // 'What\'s your favorite color?',
      // 'What\'s your favorite animal?',
    ];

    var _questionIndex = 0;
    var _total = 0;

    void _answerQuestion(int score) {
      _total += score;
      setState(() {
        ++_questionIndex;
      });
      if (_questionIndex < _questions.length) {
        print('ada pertanyaan');
      } else {
        print('ga ada lagi');
      }
    }

    void _reset() {
      setState(() {
        _questionIndex = 0;
        _total = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('M First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(questions: _questions, answerQuestion: _answerQuestion, questionIndex: _questionIndex)
            : Result(resetQuiz: _reset, totalScore: _total),
      ),
    );
  }
}
