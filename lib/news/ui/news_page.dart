import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/news/bloc/news_bloc.dart';
import 'package:flutter_t/news/data/news_repository.dart';
import 'package:flutter_t/travelers/ui/travelers_page.dart';
import 'news_screen.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);
  final newsRepository = NewsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(newsRepository),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text("Новости"),
        ),
        body: const NewsScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TravelersPage()));
          },
          backgroundColor: Colors.indigoAccent,
          child: const Icon(Icons.accessibility_sharp),
        ),
      ),
    );
  }
}
