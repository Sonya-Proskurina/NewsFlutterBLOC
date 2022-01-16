import 'package:flutter_t/news/models/news.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'news_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class NewsClient {
  factory NewsClient(Dio dio, {String baseUrl}) = _NewsClient;

  @GET("/posts")
  Future<List<News>> getNews();
}