import 'package:flutter/material.dart';
import 'package:quizonire_app/appbar.dart';
import 'package:quizonire_app/colors.dart';
import 'package:quizonire_app/first_page.dart';
import 'package:quizonire_app/quiz_page.dart';

class CurrPage extends StatefulWidget {
  const CurrPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CurrPage();
  }
}

class _CurrPage extends State<CurrPage> {
  var activeScreen = 'firstPage';
  dynamic screenWidget;

  void shiftToQuestionPage() {
    setState(() {
      activeScreen = 'questionPage';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (activeScreen == 'firstPage') {
      screenWidget = FirstPage(shiftToQuestionPage: shiftToQuestionPage);
    } else if (activeScreen == 'questionPage') {
      screenWidget = const QuizPage();
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
