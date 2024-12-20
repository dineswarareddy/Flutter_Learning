import 'package:advance_basics/questions_summary_views/question_index_view.dart';
import 'package:flutter/material.dart';
import 'question_answer_view.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({required this.summary, super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: (
          Column(
          children: summary.map(
            (eachItem) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuestionIndexView(
                    questionIndex: ((eachItem['question_index'] as int) + 1), 
                    isAnswerCorrect: (eachItem['question_answer'] == eachItem['user_answer'])),
                  SizedBox(width: 30),
                  QuestionAnswerView(eachItem: eachItem),
                ],
              );
            },
          ).toList(),
        )),
      ),
    );
  }
}
