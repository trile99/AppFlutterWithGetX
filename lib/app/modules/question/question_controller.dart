import 'dart:async';

import 'package:get/get.dart';
import 'package:quiz_app/app/data/repository/quiz_repository.dart';

import '../../data/model/quiz_model.dart';
import '../../routes/app_pages.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final QuizRepository repository;

  QuestionController({required this.repository});

  final RxBool _dataAvailable = false.obs;
  bool get dataAvailable => _dataAvailable.value;

  final RxList<Quiz> _listQuiz = RxList();
  RxList<Quiz> get listQuiz => _listQuiz;

  final listAnswerQuestion = <String>[].obs;

  RxInt currentIndexQuestion = 0.obs;

  final RxInt _numOfCorrectAns = 0.obs;
  RxInt get numOfCorrectAns => _numOfCorrectAns;

  RxInt countTime = 0.obs;

  late Timer timer;

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      countTime.value++;
    });
  }

  Future<List<Quiz>> getQuiz() async {
    resetValue();
    listQuiz.value = (await repository
        .getQuiz()
        .whenComplete(() => _dataAvailable.value = true))!;
    return listQuiz;
  }

  void resetValue() {
    listQuiz.value = [];
  }

  void checkAns(Quiz quiz, String ans) {
    // print("Ans:" + ans);
    // print("Right one: " + quiz.correctAnswer);
    if (quiz.correctAnswer == ans) {
      _numOfCorrectAns.value = _numOfCorrectAns.value + 1;
      // print("Number of correct ans " + _numOfCorrectAns.toString());
      // print("Right");
    } else {
      // print("Wrong");
    }
    listAnswerQuestion.clear();
  }

  void checkNextQuestion() {
    if (currentIndexQuestion.value != listQuiz.length - 1) {
      currentIndexQuestion.value += 1;
      listAnswerQuestion.value =
          listQuiz[currentIndexQuestion.value].allAnswers;
      listAnswerQuestion.shuffle();
    } else {
      timer.cancel();
      Get.toNamed(Routes.result, arguments: [
        {
          "time": countTime,
          "score": _numOfCorrectAns,
        }
      ]);
    }
  }

  @override
  void dispose() {
    countTime.value = 0;
    super.dispose();
  }
}
