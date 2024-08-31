import 'package:flutter/material.dart';
import 'package:quizonire_app/question_buttons.dart';
import 'package:quizonire_app/questions.dart';

var currQuestionIndex = 0;

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  var currQuestion = questions[currQuestionIndex];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currQuestion.question,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const QuestionButtons(),
        ],
      ),
    );
  }
}
