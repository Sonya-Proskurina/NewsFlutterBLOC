import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/news/bloc/news_event.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_state.dart';
import 'error_widget.dart';
import 'list_widget.dart';
import 'loading_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    final NewsBloc newsBloc = context.read<NewsBloc>();
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


