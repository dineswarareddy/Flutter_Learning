import 'package:flutter/material.dart';

class QuestionIndexView extends StatelessWidget {
  const QuestionIndexView(
      {required this.questionIndex, required this.isAnswerCorrect, super.key});

  final int questionIndex;
  final bool isAnswerCorrect;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: isAnswerCorrect ? Colors.purple : const Color.fromARGB(255, 5, 224, 244),
        child: Center(
          child: Text(questionIndex.toString(),
              textAlign: TextAlign.start,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ));
  }
}
