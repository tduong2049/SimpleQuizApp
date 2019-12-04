import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// The leading underscore turns MyAppState into a private class that is only
// accessible inside main.dart
class _MyAppState extends State<MyApp> {
  // Methods and properties to be used within a class or stateful should be
  // defined in that class.
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Red", "score": 10},
        {"text": "Green", "score": 5},
        {"text": "Blue", 'score': 3},
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Dog", "score": 10},
        {"text": "Cat", "score": 5},
        {"text": "Bird", "score": 3},
      ],
    },
    {
      "questionText": "Who's your favorite instructor?",
      "answers": [
        {"text": "Tri", "score": 10},
        {"text": "Tree", "score": 5},
        {"text": "Gee", "score": 3},
      ],
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    // Calling set state will call the build method of the widget it was
    // called in.
    // i.e. the main widget and its children are rendered again.
    // However, Flutter can detect what was changed and what exactly needs to
    // be rendered again. Not everything will be redrawn if it didn't change.
    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("We have more questions.");
    } else {
      print('No more questions.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        // If users have not reached the final question, display the current
        // question.
        // else, display that they completed every question.
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                resultScore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}
