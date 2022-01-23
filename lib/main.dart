import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t/core/platform/network_info.dart';
import 'package:flutter_t/feature_news/data/datasources/news_remote_data_source.dart';
import 'package:flutter_t/feature_news/data/repositories/news_repositories_impl.dart';
import 'package:flutter_t/feature_news/domain/repositories/news_repositories.dart';
import 'package:flutter_t/feature_news/domain/usecases/get_all_news.dart';
import 'package:flutter_t/feature_travelers/data/datasources/traveler_datasours.dart';
import 'package:flutter_t/feature_travelers/data/repositories/travelers_repositories_impl.dart';
import 'package:flutter_t/feature_travelers/domain/repositories/travelers_repositories.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'feature_news/presentation/pages/news_page.dart';
import 'feature_travelers/domain/usecases/get_total_page.dart';
import 'feature_travelers/domain/usecases/get_travelers.dart';

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

    final TravelersDataSours travelersDataSours = TravelersDataSours(dio);
    final TravelersRepository travelersRepository = TravelersRepositoriesImpl(travelersDataSours: travelersDataSours);
    final GetTravelers getTravelers = GetTravelers(travelersRepository: travelersRepository);
    final GetTotalPage getTotalPage = GetTotalPage(travelersRepository: travelersRepository);
    final RefreshController refreshController = RefreshController();

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: NewsPage(getAllNewsParams: getAllNews, getTravelers: getTravelers, getTotalPage: getTotalPage, refreshController: refreshController,),
    );
  }
}
