import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:advance_basics/data/quiz_questions.dart';
import 'questions_summary_views/questions_summary.dart';


class ResultScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResultScreenState();
  }

  const ResultScreen({
  required this.choosenAnswers,
  required this.restartQuiz, 
  super.key});

  final Function() restartQuiz;

  final List<String> choosenAnswers;
}

class _ResultScreenState extends State<ResultScreen> {
List<Map<String, Object>> fetchSummary() {
print('choosen answers ${widget.choosenAnswers.length}');


  List<Map<String, Object>> summary = [];
  for(var i=0; i<questions.length-1 ;i++) {
    var currentQuestion = questions[i];
    summary.add({
      'question_index': i,
      'question': currentQuestion.title,
      'user_answer': widget.choosenAnswers[i],
      'question_answer': currentQuestion.answers.first,
    });
  }
  return summary;
}

  @override
  Widget build(BuildContext context) {


  final correctAnswers = fetchSummary().where((test) {
    return test['user_answer'] == test['question_answer'];
  }).length;
  

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $correctAnswers out of ${questions.length} questions correctly', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            QuestionsSummary(summary: fetchSummary()),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: widget.restartQuiz,
              icon: Icon(Icons.arrow_back, color: Colors.white),
              label: Text('Retry Quiz!', style: TextStyle(color: Colors.white)),
              )
          ],
        ),
      ),
    );
  }
}
