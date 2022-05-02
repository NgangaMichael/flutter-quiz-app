import 'package:flutter/material.dart';
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

  var _questionIndex = 0;

  void _answerQuestion () {
    // for the state to change you use set state 
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'what is your favorite color',
      'what is your favorite animal',
    ];
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('App bar'),
      ),
      body: Column(
        children: [
          Questions(questions[_questionIndex]),
          ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 1')),
          ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 2')),
          ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 3'))
        ],
      )
      )
    );
  }
}