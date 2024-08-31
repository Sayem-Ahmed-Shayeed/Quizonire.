import 'package:flutter/material.dart';
import 'package:quizonire_app/colors.dart';
import 'package:quizonire_app/curr_page.dart';
import 'package:quizonire_app/questions.dart';

const space = SizedBox(height: 30);
const leftPadding = EdgeInsets.only(left: 55);

class SummaryPage2 extends StatelessWidget {
  const SummaryPage2({super.key, required this.onRestart});

  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < questions.length; i++) {
      summaryData.add({
        'index': i + 1,
        'Question': questions[i].question,
        'Correct_Answer': questions[i].answers[0],
        'User_Answer': chosenAnswer[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummaryData();
    var correctAnswer = summaryData.where((data) {
      return data['Correct_Answer'] == data['User_Answer'];
    }).length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You made it $correctAnswer out of ${questions.length}',
          style: const TextStyle(color: buttonColor, fontSize: 24),
        ),
        space,
        Center(
          child: SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                children: summaryData.map((data) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: leftPadding,
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: data['Correct_Answer'] == data['User_Answer']
                              ? const Color.fromARGB(255, 99, 255, 64)
                              : const Color.fromARGB(255, 255, 0, 100),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          ((data['index'] as int)).toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['Question'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(data['Correct_Answer'] as String,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 202, 171, 252),
                                )),
                            Text(
                              data['User_Answer'] as String,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 181, 254, 246),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        space,
        OutlinedButton.icon(
          onPressed: onRestart,
          label: const Text("Restart"),
        ),
      ],
    );
  }
}
