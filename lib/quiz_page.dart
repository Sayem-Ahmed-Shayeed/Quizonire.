import 'package:flutter/material.dart';
import 'package:quizonire_app/question_buttons.dart';
import 'package:quizonire_app/questions.dart';

var currQuestionIndex = 0;
const space = SizedBox(height: 20); //spaces between the buttons

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.addAnswer});

  final void Function(String answer) addAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  void onTap(String selectedAnswer) {
    widget.addAnswer(selectedAnswer);
    if (currQuestionIndex < questions.length - 1) {
      setState(() {
        currQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var currQuestion = questions[currQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                currQuestion.question,
                style: const TextStyle(
                    color: Color(0xffFFF5E4),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            space,
            ...currQuestion.getShuffledList().map((randomAnswer) {
              return QuestionButtons(
                currAnswer: randomAnswer,
                onTap: () {
                  onTap(randomAnswer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
