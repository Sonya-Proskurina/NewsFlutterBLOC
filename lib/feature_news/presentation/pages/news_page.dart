import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/feature_news/domain/usecases/get_all_news.dart';
import 'package:flutter_t/feature_news/presentation/bloc/news_bloc.dart';
import 'package:flutter_t/feature_travelers/domain/usecases/get_total_page.dart';
import 'package:flutter_t/feature_travelers/domain/usecases/get_travelers.dart';
import 'package:flutter_t/feature_travelers/presentation/pages/travelers_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'news_screen.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key, required this.getAllNewsParams, required this.getTravelers, required this.getTotalPage, required this.refreshController,}) : super(key: key);
  final GetAllNews getAllNewsParams;
  final GetTravelers getTravelers;
  final GetTotalPage getTotalPage;
  final RefreshController refreshController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => NewsBloc(getAllNewsParams),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text("Новости"),
        ),
        body: const NewsScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TravelersPage(getTotalPage: getTotalPage, getTravelers: getTravelers, refreshController: refreshController,)));
          },
          backgroundColor: Colors.indigoAccent,
          child: const Icon(Icons.accessibility_sharp),
        ),
      ),
    );
  }
}