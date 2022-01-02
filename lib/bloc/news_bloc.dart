import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/data/news_repository.dart';
import 'package:flutter_t/models/news.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsLoadingState());
  // NewsBloc({required this.newsRepository});

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is NewsLoadEvent) {
      yield NewsLoadingState();
      try {
        final List<News> _loadedNewsList = await newsRepository.getAllNews();
        yield NewsLoadedState(loadedNews: _loadedNewsList);
      } catch (_) {
        yield NewsErrorState();
      }
    }
  }
}