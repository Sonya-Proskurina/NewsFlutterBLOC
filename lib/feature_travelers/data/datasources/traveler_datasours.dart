import 'package:flutter_t/feature_travelers/domain/entities/travelers_entities.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_t/feature_travelers/data/models/travelers_model.dart';
import 'package:dio/dio.dart';
part 'traveler_datasours.g.dart';

@RestApi(baseUrl: "https://api.instantwebtools.net/v1/")
abstract class TravelersDataSours {
  factory TravelersDataSours(Dio dio, {String baseUrl}) = _TravelersDataSours;

  @GET("/passenger")
  Future<TravelersModel> getPages(
      @Query("page") int page,
      @Query("size") int size
      );
}