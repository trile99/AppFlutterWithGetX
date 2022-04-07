import 'package:get/get.dart';

import '../modules/home/home_page.dart';
import '../modules/question/question_binding.dart';
import '../modules/question/question_page.dart';
import '../modules/result/result_page.dart';

part './app_routes.dart';

class AppPages {
  static const home = Routes.home;
  static const question = Routes.question;
  static const result = Routes.result;
  static final routes = [
    GetPage(name: Routes.home, page: () => const HomeView()),
    GetPage(
        name: Routes.question,
        page: () => const QuestionView(),
        binding: QuestionBinding()),
    GetPage(name: result, page: () => ResultScreen()),
  ];
}
