import 'package:flutter_t/models/news.dart';

abstract class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  List<News> loadedNews;
  NewsLoadedState({required this.loadedNews});
}

class NewsErrorState extends NewsState {}