import 'package:flutter/material.dart';
import 'package:quiz/widgets/buttons.dart';
import 'package:quiz/widgets/texts.dart';
import 'data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onAnswerSelected});

  final void Function(String answer) onAnswerSelected;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onAnswerSelected(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: AssetImage('assets/images/q.png'),
              height: 200,
            ),
            Texts(currentQuestion.text, 25, Colors.lightGreenAccent,
                TextAlign.center),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return GroupButton(answerText: answer,
                  onTapped:  () => answerQuestion(answer));
            }),
          ],
        ),
      ),
    );
  }
}
