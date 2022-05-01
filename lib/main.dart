import 'package:flutter/material.dart';

void main (){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  var questionIndex = 0;

  void answerQuestion () {
    questionIndex = questionIndex + 1;
    print(questionIndex);
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
          Text(questions[questionIndex]),
          ElevatedButton(onPressed: answerQuestion, child: Text('Answer 1')),
          ElevatedButton(onPressed: answerQuestion, child: Text('Answer 2')),
          ElevatedButton(onPressed: answerQuestion, child: Text('Answer 3'))
        ],
      )
      )
    );
  }
}