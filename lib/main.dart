import 'package:flutter/material.dart';

import 'quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzer());

class Quizzer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'The IQ Quizzer',
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizAppPage(),
          ),
        ),
      ),
    );
  }
}

class QuizAppPage extends StatefulWidget {
  @override
  _QuizAppPageState createState() => _QuizAppPageState();
}

class _QuizAppPageState extends State<QuizAppPage> {
  List<Icon> scorekeeper = [];

  int qIndex = 0;

  // a list of questions with their answers
  
  // List<String> questions = [
  //   'Eminem is the fastest rapper as of the year 2020?',
  //   'The best rapper in Nigeria is M.I Abaga?',
  //   'The first woman to drive a car in Nigeria is Stella Obasanjo?',
  //   'An oxen is a male cow?',
  //   'The tallest building in the world is the Eiffel\'s tower?',
  // ];

  // List<bool> answers = [true, true, false, true, true];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(qIndex),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              color: Colors.green,
              onPressed: () {
                setState(() {
                  if (quizBrain.getQuestionAnswer(qIndex) == true) {
                    print('User is correct');
                    scorekeeper.add(
                      Icon(Icons.check, color: Colors.green),
                    );
                  } else {
                    print('User is wrong');
                    scorekeeper.add(
                      Icon(Icons.close, color: Colors.red),
                    );
                  }

                  if (qIndex < quizBrain.getQuestionLength() - 1)
                    qIndex++;
                  else
                    qIndex = 0;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              color: Colors.red,
              onPressed: () {
                setState(() {
                  if (quizBrain.getQuestionAnswer(qIndex) == false) {
                    print('User is correct');
                    scorekeeper.add(
                      Icon(Icons.check, color: Colors.green),
                    );
                  } else {
                    scorekeeper.add(
                      Icon(Icons.close, color: Colors.red),
                    );
                    print('User is wrong');
                  }

                  if (qIndex < quizBrain.getQuestionLength() - 1) {
                    qIndex++;
                  } else {
                    qIndex = 0;
                  }
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: scorekeeper,
          ),
        ),
      ],
    );
  }
}
