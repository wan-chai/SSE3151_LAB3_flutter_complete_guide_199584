import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './quiz.dart';
import './result.dart';


//void main(){
//runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    //TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
      {'questionText': 'What\'s your favorite color?', 
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
      },
      {'questionText': 'What\'s your favorite animal?', 
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
      },
      {'questionText': 'Who\'s your favorite instructor?', 
      'answers': [
        {'text': 'Max1', 'score': 1},
        {'text': 'Max2', 'score': 2},
        {'text': 'Max3', 'score': 3},
        {'text': 'Max4', 'score': 4},
      ],
      },
    ];
    
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
    _questionIndex = 0;
    _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

       if (_questionIndex < _questions.length) {
      print('We have more questions!');
    }
    else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App - 199584'),
        ),
        body: _questionIndex < _questions.length 
        ? Quiz(
          answerQuestion: _answerQuestion, 
          questionIndex: _questionIndex, 
          questions: _questions,
          )
        : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
