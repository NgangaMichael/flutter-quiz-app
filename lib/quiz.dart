import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final VoidCallback answerQuestion;

  // const Quiz({Key? key}) : super(key: key);

  Quiz({
    required this.questions, 
    required this.answerQuestion, 
    required this.questionIndex
   });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Questions(questions[questionIndex]['questionText'] as String),

          ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
            return Answer(answerQuestion, answer);
          }).toList(),
          
          // ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 1')),
          // ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 2')),
          // ElevatedButton(onPressed: _answerQuestion, child: Text('Answer 3'))
        ],
      );
  }
}