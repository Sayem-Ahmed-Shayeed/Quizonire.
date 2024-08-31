import 'package:flutter/material.dart';
import 'package:quizonire_app/appbar.dart';
import 'package:quizonire_app/colors.dart';
import 'package:quizonire_app/first_page.dart';
import 'package:quizonire_app/questions.dart';
import 'package:quizonire_app/quiz_page.dart';
import 'package:quizonire_app/summary_page.dart';

List<String> chosenAnswer = [];

class CurrPage extends StatefulWidget {
  const CurrPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CurrPage();
  }
}

class _CurrPage extends State<CurrPage> {
  dynamic screenWidget;
  var activeScreen = 'firstPage';

  void shiftToQuestionPage() {
    setState(() {
      activeScreen = 'questionPage';
    });
  }

  void addAnswer(String selectedAnswer) {
    chosenAnswer.add(selectedAnswer);
    setState(() {
      if (chosenAnswer.length == questions.length) {
        activeScreen = 'summaryPage';
      }
    });
  }

  void restartQuiz() {
    setState(() {
      chosenAnswer = [];
      currQuestionIndex = 0;
      activeScreen = 'questionPage';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (activeScreen == 'firstPage') {
      screenWidget = FirstPage(shiftToQuestionPage: shiftToQuestionPage);
    } else if (activeScreen == 'questionPage') {
      screenWidget = QuizPage(addAnswer: addAnswer);
    } else if (activeScreen == 'summaryPage') {
      screenWidget = SummaryPage2(
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar, //(this is in appbar.dart file check this out)
        backgroundColor: deepBlue,
        body: screenWidget,
      ),
    );
  }
}
