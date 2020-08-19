import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;
  Result({@required this.totalScore, @required this.resetQuiz});

  String get resultPhrase {
    String resultText = 'you did it';
    if (totalScore <= 12) {
      resultText = 'you are awesome';
    } else if (totalScore <= 15) {
      resultText = 'better';
    } else if (totalScore <= 20) {
      resultText = 'eally good';
    } else
      resultText = 'asdasdas';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(onPressed: resetQuiz, child: Text('Restaart'))
      ],
    ));
  }
}
