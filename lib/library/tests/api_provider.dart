import 'dart:convert';
import 'package:classage/library/tests/category.dart';
import 'package:classage/library/tests/question.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "https://opentdb.com/api.php";

Future<List<Question>> getQuestions(
    Category category, int total, String difficulty) async {
  String url = "$baseUrl?amount=$total&category=${category.id}";
  if (difficulty != null) {
    url = "$url&difficulty=$difficulty";
  }
  http.Response res = await http.get(Uri.parse(url));
  List<Map<String, dynamic>> questions =
      List<Map<String, dynamic>>.from(json.decode(res.body)["results"]);
  return Question.fromData(questions);
}
