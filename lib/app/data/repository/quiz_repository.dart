import 'package:quiz_app/app/data/model/quiz_model.dart';
import 'package:quiz_app/app/data/provider/question_api.dart';

class QuizRepository {
  final QuizProvider apiClient;

  QuizRepository({required this.apiClient});

  Future<List<Quiz>?> getQuiz() async {
    return apiClient.getQuiz();
  }
}
