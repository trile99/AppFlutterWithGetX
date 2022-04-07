import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/data/provider/question_api.dart';
import 'package:quiz_app/app/data/repository/quiz_repository.dart';

import '../question/question_controller.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);
  late String score;
  late String time;
  @override
  Widget build(BuildContext context) {
    final QuestionController c = Get.put(QuestionController(
        repository: QuizRepository(apiClient: QuizProvider())));
    time = c.countTime.value.toString();
    score = c.numOfCorrectAns.value.toString();

    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            int.parse(score) > 2
                ? const Text("Well done, you pass the quiz",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ))
                : const Text("Too bad, you fail the quiz",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    )),
            const SizedBox(height: 20),
            Text(
              "You answer " +
                  score +
                  " questions correctly in " +
                  time +
                  " second",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
