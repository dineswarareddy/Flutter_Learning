import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          height: 300,
          color: const Color.fromARGB(113, 254, 254, 254),
          ),
        const SizedBox(height: 30),
        Text('Learn Flutter the fun way!',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt, color: Colors.white,),
          label: const Text('Start Quiz'),
        ),
      ],
    ),
    );
  }

  startQuizSelected() {
    print('Start quiz button action');
  }
}

/* class TextButton extends StatelessWidget {
  const TextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: startQuizSelected,
      child: Text(
        'Start Quiz',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }

  startQuizSelected() {
    print('Start quiz button action');
  }
} */
