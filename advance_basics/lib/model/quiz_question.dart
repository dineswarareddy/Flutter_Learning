class QuizQuestion {
  final String title;
  final List<String> answers;

  const QuizQuestion(this.title, this.answers);

  List<String> getShuffledAnswers() {
    var duplicateAnswers = List.of(answers);
    duplicateAnswers.shuffle();
    return duplicateAnswers;
  }
}