import 'dart:convert';
import 'package:flutter_t/models/news.dart';
import 'package:http/http.dart' as http;

class NewsProvider {
  Future<List<News>> getNews() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      final List<dynamic> newsJson = json.decode(response.body);
      return newsJson.map((json) => News.fromJson(json)).toList();
    } else {
      throw Exception('Ошибка сети');
    }
  }
}