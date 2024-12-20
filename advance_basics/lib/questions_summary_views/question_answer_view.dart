import 'package:flutter/material.dart';

class QuestionAnswerView extends StatelessWidget {
  const QuestionAnswerView({required this.eachItem, super.key});

  final Map<String, Object> eachItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(eachItem['question'].toString(),
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(eachItem['user_answer'].toString(),
            textAlign: TextAlign.left,
            style: TextStyle(
                color: const Color.fromARGB(255, 225, 144, 239),
                fontWeight: FontWeight.bold)),
        Text(eachItem['question_answer'].toString(),
            textAlign: TextAlign.left,
            style: TextStyle(
                color: const Color.fromARGB(255, 127, 116, 192),
                fontWeight: FontWeight.bold)),
        SizedBox(height: 30),
      ],
    ));
  }
}
