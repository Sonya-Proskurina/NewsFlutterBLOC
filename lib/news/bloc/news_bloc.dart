import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/news/data/news_repository.dart';
import 'package:flutter_t/news/models/news.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(NewsLoadingState()){
    on<NewsLoadEvent>((event,emit) async {
      emit(NewsLoadingState());
          try {
            final List<News> _loadedNewsList = await newsRepository.getAllNews();
            emit(NewsLoadedState(loadedNews: _loadedNewsList));
          } catch (_) {
            emit(NewsErrorState());
          }
    });
  }
}