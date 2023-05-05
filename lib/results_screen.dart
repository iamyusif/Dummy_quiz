import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/widgets/questions_summary.dart';
import 'package:quiz/widgets/texts.dart';

class Results extends StatelessWidget {
  const Results({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final summaryData = getSummaryData();
    final numCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Texts(
                    "You answered $numTotalQuestions out of $numCorrectAnswers questions correctly",
                    25,
                    Colors.lightGreen,
                    TextAlign.center),
                const SizedBox(height: 20),
                QuestionsSummary(summaryData),
                const SizedBox(height: 20),
                const TextButton(
                  onPressed: null,
                  child: Text(
                    "Restart Quiz",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )));
  }
}
