import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/core/di/locator_service.dart';
import 'package:flutter_t/feature_news/presentation/bloc/news_bloc.dart';
import 'package:flutter_t/feature_travelers/presentation/pages/travelers_page.dart';
import 'news_screen.dart';


class NewsPage extends StatelessWidget {
  NewsPage({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => sl<NewsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text("Новости"),
        ),
        body: const NewsScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TravelersPage()));
          },
          backgroundColor: Colors.indigoAccent,
          child: const Icon(Icons.accessibility_sharp),
        ),
      ),
    );
  }
}