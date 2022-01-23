import 'package:flutter_t/travelers/models/travelers.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'traveler_datasours.g.dart';

@RestApi(baseUrl: "https://api.instantwebtools.net/v1/")
abstract class TravelersDataSours {
  factory TravelersDataSours(Dio dio, {String baseUrl}) = _TravelersDataSours;

  @GET("/passenger")
  Future<TravelersPage> getPages(
      @Query("page") int page,
      @Query("size") int size
      );
}