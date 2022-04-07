import 'package:get/get.dart';
import 'package:quiz_app/app/data/provider/question_api.dart';
import 'package:quiz_app/app/data/repository/quiz_repository.dart';
import 'package:quiz_app/app/modules/question/question_controller.dart';

class QuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<QuestionController>(QuestionController(
        repository: QuizRepository(apiClient: QuizProvider())));
  }
}
