import 'package:flutter_t/travelers/models/travelers.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'travelers_client.g.dart';

@RestApi(baseUrl: "https://api.instantwebtools.net/v1/")
abstract class TravelersClient {
  factory TravelersClient(Dio dio, {String baseUrl}) = _TravelersClient;

  @GET("/passenger")
  Future<TravelersPage> getPages(
      @Query("page") int page,
      @Query("size") int size
      );
}