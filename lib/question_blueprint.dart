class Question {
  const Question({required this.question, required this.answers});

  final String question;
  final List<String> answers;

  List<String> getShuffledList() {
    List<String> shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}
