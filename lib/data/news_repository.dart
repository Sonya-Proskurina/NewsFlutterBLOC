import 'package:flutter_t/models/news.dart';
import 'news_provider.dart';

class NewsRepository {
  final NewsProvider _newsProvider = NewsProvider();
  Future<List<News>> getAllNews() => _newsProvider.getNews();
}