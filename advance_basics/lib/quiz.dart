import 'package:advance_basics/data/quiz_questions.dart';
import 'package:advance_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'quiz_welcome_screen.dart';
import 'results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;
  String currentScreenName = 'welcome_screen';
  List<String> answersSelected = [];

  @override
  void initState() {
    currentScreen = WelcomeScreen(switchScreen);
    super.initState();
  }

  void saveSelectedAnswer(String answer) {
    answersSelected.add(answer);
    if (answersSelected.length == questions.length) {
      setState(() {
        currentScreenName = 'results_screen'; //WelcomeScreen(switchScreen);
      });
    }
  }

  void switchScreen() {
    setState(() {
      currentScreenName =
          'questions_screen'; //QuestionsScreen(onSelectedAnswer: saveSelectedAnswer);
    });
  }

  void restartQuiz() {
    setState(() {
      currentScreenName = 'welcome_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentScreenName == 'welcome_screen') {
      answersSelected=[];
      currentScreen = WelcomeScreen(switchScreen);
    } else if (currentScreenName == 'results_screen') {
      currentScreen = ResultScreen(choosenAnswers: answersSelected, restartQuiz: restartQuiz);
    } else {
      currentScreen = QuestionsScreen(onSelectedAnswer: saveSelectedAnswer);
    }
//  List<Map<String, Object>> details = [];

    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.purple,
            body: Container(
              decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.deepPurple, Colors.purple]),
              ),
              child: currentScreen,
            )));
  }
}
