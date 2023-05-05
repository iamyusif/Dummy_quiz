import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/results_screen.dart';
import 'helloScreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  final List<String> selectedAnswers = [];

  @override
  initState() {
    super.initState();
    activeScreen = HelloScreenApp(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = Questions(onAnswerSelected: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);
      if (selectedAnswers.length == questions.length) {
        activeScreen = Results(chosenAnswers: selectedAnswers);
        // selectedAnswers.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.grey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
