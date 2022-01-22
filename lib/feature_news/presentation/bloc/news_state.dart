import 'package:flutter_t/feature_news/domain/entities/news_entities.dart';

abstract class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  List<NewsEntities> loadedNews;
  NewsLoadedState({required this.loadedNews});
}

class NewsErrorState extends NewsState {}