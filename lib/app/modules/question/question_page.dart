import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'question_controller.dart';

class QuestionView extends GetView<QuestionController> {
  const QuestionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: GetX<QuestionController>(
          initState: (_) {
            controller.startTime();
            controller.getQuiz().then((value) {
              controller.listAnswerQuestion.value =
                  value[controller.currentIndexQuestion.value].allAnswers;
              controller.listAnswerQuestion.shuffle();
            });
          },
          builder: (_) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !controller.dataAvailable
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                                "Question ${controller.currentIndexQuestion.value + 1}/${controller.listQuiz.length}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                )),
                            const SizedBox(height: 20),
                            Text(
                                HtmlUnescape().convert(controller
                                    .listQuiz[
                                        controller.currentIndexQuestion.value]
                                    .question),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                            const SizedBox(height: 20),
                            ...List.generate(
                                controller.listAnswerQuestion.length, (index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.checkAns(
                                        controller.listQuiz[controller
                                            .currentIndexQuestion.value],
                                        controller.listAnswerQuestion[index]
                                            .toString());
                                    controller.checkNextQuestion();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrangeAccent,
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Center(
                                      child: Text(HtmlUnescape().convert(
                                          controller.listAnswerQuestion[index]
                                              .toString())),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
