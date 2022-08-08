import 'package:flutter/material.dart';

// a different file to display questions 
class Questions extends StatelessWidget{

  final String questionText;
  Questions(this.questionText);

  Widget build(BuildContext context){
    return Container(
      // double infinity centers evrything 
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      )
    );
  }
}