import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final VoidCallback answerQuestion;

  // const Quiz({Key? key}) : super(key: key);

  Quiz({
    @required this.questions, 
    @required this.answerQuestion, 
    @required this.questionIndex
   });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Questions(questions[questionIndex]['questionText'] as String),
              // answer is a map
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
            return Answer(() => answerQuestion(answer['score']), answer['text'] as String);
          }).toList(),
        ],
      );
  }
}