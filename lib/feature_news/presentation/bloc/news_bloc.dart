import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/feature_news/domain/usecases/get_all_news.dart';
import 'package:flutter_t/feature_news/presentation/bloc/news_event.dart';
import 'package:flutter_t/feature_news/presentation/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetAllNews getAllNews;

  NewsBloc(this.getAllNews) : super(NewsLoadingState()){
    on<NewsLoadEvent>((event,emit) async {
      emit(NewsLoadingState());
        final _loadedNewsList = await getAllNews(GetAllNewsParams());
        _loadedNewsList.fold(
                (l) => emit(NewsErrorState()),
                (r) =>  emit(NewsLoadedState(loadedNews: r)),
        );
    });
  }
}