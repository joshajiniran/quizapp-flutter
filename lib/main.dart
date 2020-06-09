import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  void checkAnswer(bool userChoice) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        var alert = Alert(
            context: context,
            type: AlertType.info,
            title: "Quiz Completed",
            desc:
                "You have completed the quiz, your result is being compiled and will be sent to you",
            style: AlertStyle(
              animationType: AnimationType.fromTop,
              isCloseButton: false,
              isOverlayTapDismiss: false,
              descStyle: TextStyle(fontWeight: FontWeight.bold),
              animationDuration: Duration(milliseconds: 400),
              alertBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: BorderSide(
                  color: Colors.grey,
                ),
              ),
              titleStyle: TextStyle(color: Colors.red),
            ),
            buttons: [
              DialogButton(
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                width: 150,
                height: 50,
              )
            ]);

        alert.show();
        quizBrain.reset();
        scorekeeper.clear();
      } else {
        if (userChoice == correctAnswer) {
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
        quizBrain.nextQuestion();
      }
    });
  }

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
                quizBrain.getQuestionText(),
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
              onPressed: () => checkAnswer(true),
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
              onPressed: () => checkAnswer(false),
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
