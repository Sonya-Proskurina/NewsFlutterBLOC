import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_t/core/error/failures.dart';
import 'package:flutter_t/core/usecases/usecase.dart';
import 'package:flutter_t/feature_news/domain/entities/news_entities.dart';
import 'package:flutter_t/feature_news/domain/repositories/news_repositories.dart';

class GetAllNews extends UseCase<List<NewsEntities>, GetAllNewsParams> {
  final NewsRepositories newsRepositories;

  GetAllNews(this.newsRepositories);

  @override
  Future<Either<Failure, List<NewsEntities>>> call(GetAllNewsParams params) async {
    return await newsRepositories.getAllNews();
  }
}

class GetAllNewsParams extends Equatable {
  @override
  List<Object?> get props => [];
}
