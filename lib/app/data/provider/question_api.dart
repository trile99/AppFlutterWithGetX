import 'dart:convert';

import 'package:get/get.dart';

import '../model/quiz_model.dart';

import 'package:http/http.dart' as http;

class QuizProvider extends GetConnect {
  Future<List<Quiz>?> getQuiz() async {
    try {
      final response = await http.get(Uri.parse(
          'https://opentdb.com/api.php?amount=5&category=12&difficulty=easy&type=multiple'));
      if (response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        return (responseJson['results'] as List)
            .map((e) => Quiz.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return null;
    }
  }
}
