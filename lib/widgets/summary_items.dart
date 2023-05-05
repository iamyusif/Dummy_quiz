import 'package:flutter/material.dart';
import 'package:quiz/widgets/questions_id.dart';

class SummaryItems extends StatelessWidget {
  const SummaryItems(this.itemData, {super.key});

  final List<Map<String, Object>> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: itemData.map(
            (data) {
              return Row(
                children: [
                  QuestionsIds(
                    questionIndex: data['question_index'] as int,
                    isCorrectAnswer: data['is_correct_answer'] as bool,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(data['question'] as String),
                        const SizedBox(height: 10),
                        Text(data['user_answer'] as String),
                        Text(data['correct_answer'] as String),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
