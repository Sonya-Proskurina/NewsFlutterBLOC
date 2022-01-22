import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t/core/platform/network_info.dart';
import 'package:flutter_t/feature_news/data/datasources/news_remote_data_source.dart';
import 'package:flutter_t/feature_news/data/repositories/news_repositories_impl.dart';
import 'package:flutter_t/feature_news/domain/repositories/news_repositories.dart';
import 'package:flutter_t/feature_news/domain/usecases/get_all_news.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'feature_news/presentation/pages/news_page.dart';

// flutter pub run build_runner build
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final dio = Dio();
    final InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
    final NetworkInfo networkInfo = NetworkInfoImp(internetConnectionChecker);
    final newsRemoteDataSource = NewsRemoteDataSource(dio);
    NewsRepositories newsRepositories = NewsRepositoriesImpl(newsRemoteDataSource: newsRemoteDataSource, networkInfo: networkInfo);
    GetAllNews getAllNews = GetAllNews(newsRepositories);

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: NewsPage(getAllNewsParams: getAllNews,),
    );
  }
}
