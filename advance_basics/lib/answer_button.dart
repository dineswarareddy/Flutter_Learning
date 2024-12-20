import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.onTap,required this.answer, super.key});
  final Function() onTap;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16),
        foregroundColor: Colors.white, 
        backgroundColor: const Color.fromARGB(255, 6, 167, 51)),
      child: Text(answer, textAlign: TextAlign.center), 
      );
  }
}