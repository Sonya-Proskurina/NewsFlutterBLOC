import 'package:dartz/dartz.dart';
import 'package:flutter_t/core/error/failures.dart';
import 'package:flutter_t/core/platform/network_info.dart';
import 'package:flutter_t/feature_news/data/datasources/news_local_data_source.dart';
import 'package:flutter_t/feature_news/data/datasources/news_remote_data_source.dart';
import 'package:flutter_t/feature_news/domain/entities/news_entities.dart';
import 'package:flutter_t/feature_news/domain/repositories/news_repositories.dart';

class NewsRepositoriesImpl extends NewsRepositories {
  NewsRemoteDataSource newsRemoteDataSource;
  NewsLocalDataSource newsLocalDataSource;
  NetworkInfo networkInfo;

  NewsRepositoriesImpl({
    required this.newsRemoteDataSource,
    required this.networkInfo,
    required this.newsLocalDataSource
  });

  @override
  Future<Either<Failure, List<NewsEntities>>> getAllNews() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteNews = await newsRemoteDataSource.getNews();
        newsLocalDataSource.newsToCache(remoteNews);
        return Right(remoteNews);
      } catch(e) {
        print("!SOS!- "+e.toString());
        return Left(ServerFailure());
      }
    } else {
      final localPerson = await newsLocalDataSource.getLastNewsFromCache();
      if (localPerson.isEmpty) {
        return Left(CacheFailure());
      } else {
        return Right(localPerson);
      }
    }
  }
}
