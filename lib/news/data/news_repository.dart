import 'package:dio/dio.dart';
import 'package:flutter_t/news/models/news.dart';
import 'news_client.dart';

class NewsRepository {
  static final dio = Dio();
  final client = NewsClient(dio);

  Future<List<News>> getAllNews() => client.getNews();
}