import 'package:classage/library/tests/question.dart';
import 'package:flutter/material.dart';

import 'check_answers.dart';

class QuizFinishedPage extends StatelessWidget {
  QuizFinishedPage({
    Key? key,
    required this.questions,
    required this.answers,
  }) : super(key: key);
  final List<Question> questions;
  final Map<int, dynamic> answers;
  int? correctAnswers;

  @override
  Widget build(BuildContext context) {
    int correct = 0;
    answers.forEach((index, value) {
      if (questions[index].correctAnswer == value) correct++;
    });
    const TextStyle titleStyle = TextStyle(
        color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w500);
    final TextStyle trailingStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).primaryColor,
          //Theme.of(context).accentColor
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text("Total Questions", style: titleStyle),
                  trailing: Text("${questions.length}", style: trailingStyle),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text("Score", style: titleStyle),
                  trailing: Text("${correct / questions.length * 100}%",
                      style: trailingStyle),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text("Correct Answers", style: titleStyle),
                  trailing: Text("$correct/${questions.length}",
                      style: trailingStyle),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: const Text("Incorrect Answers", style: titleStyle),
                  trailing: Text(
                      "${questions.length - correct}/${questions.length}",
                      style: trailingStyle),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0),
                      //primary: Theme.of(context).accentColor.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text("Goto Home"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      primary: Colors.pink[50],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text("Check Answers"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CheckAnswersPage(
                            questions: questions,
                            answers: answers,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
