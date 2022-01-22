import 'package:dartz/dartz.dart';
import 'package:flutter_t/core/error/exceptions.dart';
import 'package:flutter_t/core/error/failures.dart';
import 'package:flutter_t/core/platform/network_info.dart';
import 'package:flutter_t/feature_news/data/datasources/news_remote_data_source.dart';
import 'package:flutter_t/feature_news/domain/entities/news_entities.dart';
import 'package:flutter_t/feature_news/domain/repositories/news_repositories.dart';

class NewsRepositoriesImpl extends NewsRepositories {
  NewsRemoteDataSource newsRemoteDataSource;
  NetworkInfo networkInfo;

  NewsRepositoriesImpl({
    required this.newsRemoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<NewsEntities>>> getAllNews() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await newsRemoteDataSource.getNews();
        return Right(remotePerson);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
