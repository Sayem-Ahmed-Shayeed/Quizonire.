import 'package:flutter/material.dart';
import 'package:quizonire_app/colors.dart';

const spaceBetweenChildren = SizedBox(
  height: 30,
);

class FirstPage extends StatelessWidget {
  const FirstPage({super.key, required this.shiftToQuestionPage});

  final void Function() shiftToQuestionPage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/quiz-logo.png',
            width: 300,
            height: 300,
            color: transparentWhite,
          ),
          spaceBetweenChildren,
          OutlinedButton.icon(
            onPressed: shiftToQuestionPage,
            icon: const Icon(
              Icons.chevron_right,
              weight: 400,
              color: Colors.white,
            ),
            label: const Text(
              "S t a r t",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
