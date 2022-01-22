import 'package:dartz/dartz.dart';
import 'package:flutter_t/core/error/failures.dart';
import 'package:flutter_t/feature_news/domain/entities/news_entities.dart';

abstract class NewsRepositories {
  Future<Either<Failure, List<NewsEntities>>> getAllNews();
}