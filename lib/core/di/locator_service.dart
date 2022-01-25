import 'package:dio/dio.dart';
import 'package:flutter_t/core/platform/network_info.dart';
import 'package:flutter_t/feature_news/data/datasources/news_local_data_source.dart';
import 'package:flutter_t/feature_news/data/datasources/news_remote_data_source.dart';
import 'package:flutter_t/feature_news/data/repositories/news_repositories_impl.dart';
import 'package:flutter_t/feature_news/domain/repositories/news_repositories.dart';
import 'package:flutter_t/feature_news/domain/usecases/get_all_news.dart';
import 'package:flutter_t/feature_news/presentation/bloc/news_bloc.dart';
import 'package:flutter_t/feature_travelers/data/datasources/traveler_datasours.dart';
import 'package:flutter_t/feature_travelers/data/repositories/travelers_repositories_impl.dart';
import 'package:flutter_t/feature_travelers/domain/repositories/travelers_repositories.dart';
import 'package:flutter_t/feature_travelers/domain/usecases/get_total_page.dart';
import 'package:flutter_t/feature_travelers/domain/usecases/get_travelers.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => NewsBloc(sl()));
  sl.registerFactory(() => TravelersBloc(getTotalPage: sl(), getTravelers: sl(), refreshController: sl()));

  // UseCases news
  sl.registerLazySingleton(() => GetAllNews(newsRepositories: sl()));
  sl.registerLazySingleton(() => GetTravelers(travelersRepository: sl()));

  // UseCases travelers
  sl.registerLazySingleton(() => GetTotalPage(travelersRepository: sl()));

  // Repository news
  sl.registerLazySingleton<NewsRepositories>(
        () => NewsRepositoriesImpl(
            newsRemoteDataSource: sl(),
            networkInfo: sl(),
            newsLocalDataSource: sl())
  );

  sl.registerLazySingleton<NewsRemoteDataSource>(
        () => NewsRemoteDataSource(sl())
  );

  sl.registerLazySingleton<NewsLocalDataSource>(
        () => NewsLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Repository travelers
  sl.registerLazySingleton<TravelersRepository>(
  () => TravelersRepositoriesImpl(travelersDataSours: sl())
  );

  sl.registerLazySingleton<TravelersDataSours>(
  () => TravelersDataSours(sl())
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImp(sl()),
  );

  // External
  final  sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => RefreshController());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}