import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
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
    final questions = const [
      {'questionText': 'what is your favorite color?',
        'answers': [
          'black',
          'red',
          'green',
          'white'
        ]
      },
      {'questionText': 'what is your favorite animal',
        'answers': [
          'rabbit',
          'goat',
          'lion',
          'dog'
        ]
      },
      {'questionText': 'what is your favorite car',
        'answers': [
          'tesla',
          'toyota',
          'hyundai',
          'mercides'
        ]
      },
    ];

  var _questionIndex = 0;

  void _answerQuestion () {
    
    // for the state to change you use set state 
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if(_questionIndex < questions.length) {
      print('we have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(home: Scaffold(
      appBar: AppBar(
        title: Text('Flutter quiz app'),
      ),
      body: _questionIndex < questions.length ? Column(
        children: [
          Questions(questions[_questionIndex]['questionText'] as String),

          ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList(),
          
          // ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 1')),
          // ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 2')),
          // ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 3'))
        ],
      ) : Center(child: Text('You did it'),)
      ),
    );
  }
}