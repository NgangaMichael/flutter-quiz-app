import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';
import './question.dart';
void main (){
  runApp(MyApp());
}

// changed staeless widget to a statefil widget 
// when _ is used before a property it locks it to that specific dart file or class 
class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  // we can use map or {} to indicate a map 
    final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 4},
        {'text': 'Alex', 'score': 7},
        {'text': 'Travis', 'score': 5},
        {'text': 'Kim', 'score': 2},
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

  void _answerQuestion (int score) {

    // old style 
    // _totalScore = _totalScore + score;

    // new style 
    _totalScore += score;
    
    // for the state to change you use set state 
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if(_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: const Text('Flutter quiz app'),
      ),
      body: _questionIndex < _questions.length ? 
      Quiz(
      answerQuestion: _answerQuestion, 
      questionIndex: _questionIndex, 
      questions: _questions
      ) 
      : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}