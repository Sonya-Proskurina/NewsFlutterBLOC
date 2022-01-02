import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/bloc/news_event.dart';

import 'bloc/news_bloc.dart';
import 'bloc/news_state.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    final NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);
    newsBloc.add(NewsLoadEvent());

    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return const LoadingWidget();
        } else if (state is NewsLoadedState) {
          return ListWidget(state: state);
        } else {
          return const ErrorWidget();
        }
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Ошибка! Пожалуйста, проверьте интернет соединение!',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  NewsLoadedState state;

  ListWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.loadedNews.length,
      itemBuilder: (context, index) => Container(
        child: ListItemWidget(state: state, index: index),
      ),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  NewsLoadedState state;
  int index;
  ListItemWidget({Key? key, required this.state, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(right: 8,left: 8,bottom: 4, top: 4),
    child: Column(
      children: [
      Text(state.loadedNews[index].title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87
        ),
      ),
        const SizedBox(height: 8,),
        Text(state.loadedNews[index].body,
          style: const TextStyle(
              fontSize: 14,
          ),
        ),
      ]
    )
    );
  }
}


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
