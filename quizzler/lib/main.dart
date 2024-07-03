import 'package:flutter/material.dart';
import 'package:quizzler/questionBank.dart';

void main() => runApp(Quizzler());

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  List<bool> answers = [];
  Widget build(BuildContext context) {
    return answers.length < questions.length
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      questions[answers.length].text,
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
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: const Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      //The user picked true.
                      setState(() {
                        answers.add(true);
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    child: const Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      //The user picked false.
                      setState(() {
                        answers.add(false);
                      });
                    },
                  ),
                ),
              ),
              //TODO: Add a Row here as your score keeper
              Row(
                children: answers.length > 0
                    ? answers.indexed.map((answer) {
                        if (questions[answer.$1].answer == answer.$2)
                          return Icon(Icons.check, color: Colors.green);
                        else
                          return Icon(Icons.close, color: Colors.red);
                      }).toList()
                    : [
                        Icon(
                          Icons.access_time_outlined,
                          color: Colors.white,
                        )
                      ],
              )
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Your score is ${answers.indexed.map((answer) => (questions[answer.$1].answer) == answer.$2 ? 1 : 0).reduce((sum, e) => sum + e)}/${questions.length}',
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
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    child: const Text(
                      'Try again',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      //The user picked false.
                      setState(() {
                        answers = [];
                      });
                    },
                  ),
                ),
              ),
            ],
          );
  }
}
