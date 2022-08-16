import 'package:classage/library/tests/category.dart';
import 'package:classage/library/tests/pages/quiz_finished.dart';
import 'package:classage/library/tests/question.dart';
import 'package:flutter/material.dart';
import 'package:classage/services/stylesheet.dart';
import 'package:html_unescape/html_unescape.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key, required this.questions, required this.category})
      : super(key: key);
  final List<Question> questions;
  final Category category;

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  final TextStyle _questionStyle = const TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];
    final List<dynamic> options = question.incorrectAnswers;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

    return WillPopScope(
      onWillPop: () async {
        bool? result = await _onWillPop();
        result ??= false;
        return result;
      },
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text(widget.category.name),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Text("${_currentIndex + 1}"),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          HtmlUnescape().convert(
                              widget.questions[_currentIndex].question),
                          softWrap: true,
                          style: MediaQuery.of(context).size.width > 800
                              ? _questionStyle.copyWith(fontSize: 30.0)
                              : _questionStyle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ...options.map(
                          (option) => RadioListTile<bool>(
                            title: Text(
                              HtmlUnescape().convert("$option"),
                              style: MediaQuery.of(context).size.width > 800
                                  ? const TextStyle(fontSize: 30.0)
                                  : null,
                            ),
                            groupValue: _answers[_currentIndex],
                            value: option,
                            onChanged: (value) {
                              setState(() {
                                _answers[_currentIndex] = option;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        // padding: MediaQuery.of(context).size.width > 800
                        //     ? const EdgeInsets.symmetric(
                        //         vertical: 20.0, horizontal: 64.0)
                        //     : null,
                        onPressed: _nextSubmit,
                        child: Text(
                          _currentIndex == (widget.questions.length - 1)
                              ? "Submit"
                              : "Next",
                          style: MediaQuery.of(context).size.width > 800
                              ? const TextStyle(fontSize: 30.0)
                              : null,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      mySnackBar(
        context,
        const Text("You must select an answer to continue."),
      );
      return;
    }
    if (_currentIndex < (widget.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>
              QuizFinishedPage(questions: widget.questions, answers: _answers),
        ),
      );
    }
  }

  Future<bool?> _onWillPop() async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: const Text(
              "Are you sure you want to quit the quiz? All your progress will be lost."),
          title: const Text("Warning!"),
          actions: <Widget>[
            OutlinedButton(
              child: const Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            OutlinedButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
    return null;
  }
}
