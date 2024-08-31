import 'package:flutter/material.dart';
import 'package:quizonire_app/questions.dart';
import 'package:quizonire_app/quiz_page.dart';

class QuestionButtons extends StatefulWidget {
  const QuestionButtons({super.key});

  @override
  State<QuestionButtons> createState() {
    return _QuestionButtons();
  }
}

class _QuestionButtons extends State<QuestionButtons> {
  //declare variables & functions her

  @override
  Widget build(BuildContext context) {
    //logic here
    return TextButton(
      onPressed: () {},
      child: Text(
        questions[currQuestionIndex].answers[0],
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
