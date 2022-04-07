class Quiz {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;
  List<String> get allAnswers {
    return [...incorrectAnswers, correctAnswer];
  }

  const Quiz(
      {required this.category,
      required this.type,
      required this.difficulty,
      required this.question,
      required this.correctAnswer,
      required this.incorrectAnswers});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      category: json['category'],
      type: json['type'],
      difficulty: json['difficulty'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: json['incorrect_answers'],
    );
  }
}
