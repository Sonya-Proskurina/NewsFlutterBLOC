import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t/core/platform/network_info.dart';
import 'package:flutter_t/feature_news/data/datasources/news_local_data_source.dart';
import 'package:flutter_t/feature_news/data/datasources/news_remote_data_source.dart';
import 'package:flutter_t/feature_news/data/repositories/news_repositories_impl.dart';
import 'package:flutter_t/feature_news/domain/repositories/news_repositories.dart';
import 'package:flutter_t/feature_news/domain/usecases/get_all_news.dart';
import 'package:flutter_t/feature_travelers/data/datasources/traveler_datasours.dart';
import 'package:flutter_t/feature_travelers/data/repositories/travelers_repositories_impl.dart';
import 'package:flutter_t/feature_travelers/domain/repositories/travelers_repositories.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di/locator_service.dart';
import 'feature_news/presentation/pages/news_page.dart';
import 'feature_travelers/domain/usecases/get_total_page.dart';
import 'feature_travelers/domain/usecases/get_travelers.dart';
import 'package:flutter_t/core/di/locator_service.dart' as di;


late GetAllNews getAllNews;
late GetTravelers getTravelers;
late GetTotalPage getTotalPage;
late RefreshController refreshController;

// flutter pub run build_runner build
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: NewsPage(),
    );
  }
}

// Future<void> getServers() async {
//   final dio = Dio();
//   final InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();
//   final NetworkInfo networkInfo = NetworkInfoImp(internetConnectionChecker);
//   final NewsRemoteDataSource newsRemoteDataSource = NewsRemoteDataSource(dio);
//   final sharedPreferences = await SharedPreferences.getInstance();
//   final NewsLocalDataSource newsLocalDataSource = NewsLocalDataSourceImpl(sharedPreferences: sharedPreferences);
//   NewsRepositories newsRepositories = NewsRepositoriesImpl(newsRemoteDataSource: newsRemoteDataSource, networkInfo: networkInfo, newsLocalDataSource: newsLocalDataSource);
//   getAllNews = GetAllNews(newsRepositories);
//
//   final TravelersDataSours travelersDataSours = TravelersDataSours(dio);
//   final TravelersRepository travelersRepository = TravelersRepositoriesImpl(travelersDataSours: travelersDataSours);
//   getTravelers = GetTravelers(travelersRepository: travelersRepository);
//   getTotalPage = GetTotalPage(travelersRepository: travelersRepository);
//
//   refreshController = RefreshController();
//   return Future.value();
// }
