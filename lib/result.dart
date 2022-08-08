import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // const Result({Key? key}) : super(key: key);

  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resulText;
    if(resultScore <= 8) {
      resulText = 'You are awsome and innocent';
    } else if (resultScore <= 12) {
      resulText = 'You are pretty likeable';
    } else if (resultScore <= 16) {
      resulText = 'You are.... strange';
    } else {
      resulText = 'You are soo bad';
    }
    return resulText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resultPhrase, 
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          ElevatedButton(
            onPressed: resetHandler, 
            child: Text('Restart Quiz')
          )
        ],
      ),
    );
  }
}