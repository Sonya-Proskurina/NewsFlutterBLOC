import 'package:dio/dio.dart';
import 'package:flutter_t/feature_news/data/models/news_model.dart';
import 'package:retrofit/retrofit.dart';
part 'news_remote_data_source.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class NewsRemoteDataSource {
  factory NewsRemoteDataSource(Dio dio, {String baseUrl}) = _NewsRemoteDataSource;

  @GET("/posts")
  Future<List<NewsModel>> getNews();
}