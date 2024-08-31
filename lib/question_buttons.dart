import 'package:flutter/material.dart';
import 'package:quizonire_app/colors.dart';

class QuestionButtons extends StatelessWidget {
  const QuestionButtons({
    super.key,
    required this.currAnswer,
    required this.onTap,
  });

  final String currAnswer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: onTap,
      child: Text(
        currAnswer,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
