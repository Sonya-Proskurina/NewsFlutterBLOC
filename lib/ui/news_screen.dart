import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/bloc/news_event.dart';

import '../bloc/news_bloc.dart';
import '../bloc/news_state.dart';
import 'error_widget.dart';
import 'list_widget.dart';
import 'loading_widget.dart';

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
          return const ErrorListWidget();
        }
      },
    );
  }
}


