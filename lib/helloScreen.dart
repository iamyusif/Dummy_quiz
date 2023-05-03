import 'package:flutter/material.dart';
import 'package:quiz/widgets/texts.dart';

class HelloScreenApp extends StatelessWidget {

  const HelloScreenApp(this.startQuiz , {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.7,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/q.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          const Texts("Start the game to test yourself", 28, Colors.lightGreenAccent, TextAlign.center),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black, width: 2),
              backgroundColor: Colors.lightGreenAccent,
              minimumSize: const Size(200, 50),
            ),
            icon: const Icon(Icons.play_arrow),
            label: const Texts("Start", 20, Colors.black, TextAlign.center),
            onPressed: () {
              startQuiz();
            },
          ),
        ],
      ),
    );
  }
}
