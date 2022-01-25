import 'dart:convert';
import 'package:flutter_t/core/constants/constants.dart';
import 'package:flutter_t/feature_news/data/models/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NewsLocalDataSource {
  Future<List<NewsModel>> getLastNewsFromCache();
  Future<void> newsToCache(List<NewsModel> persons);
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final SharedPreferences sharedPreferences;

  NewsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<NewsModel>> getLastNewsFromCache() {
    final jsonNewsList = sharedPreferences.getStringList(CACHED_NEWS_LIST);
    if (jsonNewsList==null) return Future.value([]);
    return Future.value(jsonNewsList
        .map((news) => NewsModel.fromJson(json.decode(news)))
        .toList());
  }

  @override
  Future<void> newsToCache(List<NewsModel> news) {
    final List<String> jsonNewsList =
        news.map((news) => json.encode(news.toJson())).toList();
    sharedPreferences.setStringList(CACHED_NEWS_LIST, jsonNewsList);
    // return Future.value(jsonNewsList);
    return Future.value();
  }
}
