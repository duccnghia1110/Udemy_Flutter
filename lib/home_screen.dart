import 'package:flutter/material.dart';
import 'package:hihi/question.dart';
import './answer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: implement createState
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
      if (_questionIndex == 3) {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map> questions = [
      {
        'questionText': 'What\'s your favorite color',
        'answer': ['Back', 'Red', 'Greens', 'Brow'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answer': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answer': ['Max', 'Max', 'Max', 'Max'],
      },
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text("Flutter App"),
          ),
          body: Column(
            children: [
              Question(questions[_questionIndex]["questionText"]),
              ...(questions[_questionIndex]['answer'] as List<String>)
                  .map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          )),
    );
  }
}
