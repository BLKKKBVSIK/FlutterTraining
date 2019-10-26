import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  String get resultScore {
    String scoreText;

    if (totalScore >= 24) {
      scoreText = "good";
    } else if (totalScore >= 16 && totalScore < 24) {
      scoreText = "meh...";
    } else if (totalScore < 16) {
      scoreText = "lame :(";
    }
    return (scoreText);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            "You did " +
                totalScore.toString() +
                "\n\nIt's pretty " +
                resultScore,
            style: TextStyle(
              fontSize: 28,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Restart ?", style: TextStyle(fontSize: 18, color: Colors.blue),),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
