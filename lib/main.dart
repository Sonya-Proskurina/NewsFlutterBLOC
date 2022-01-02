import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/bloc/news_bloc.dart';
import 'package:flutter_t/data/news_repository.dart';

import 'ui/news_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NewsPage());
  }
}

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);
  final newsRepository = NewsRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(newsRepository),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Новости"),
        ),
        body: NewsList(),
      ),
    );
  }
}
