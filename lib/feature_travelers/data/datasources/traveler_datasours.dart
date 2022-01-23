import 'package:flutter_t/core/constants/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_t/feature_travelers/data/models/travelers_model.dart';
import 'package:dio/dio.dart';
part 'traveler_datasours.g.dart';

@RestApi(baseUrl: TRAVELERS_BASE_URI)
abstract class TravelersDataSours {
  factory TravelersDataSours(Dio dio, {String baseUrl}) = _TravelersDataSours;

  @GET("/passenger")
  Future<TravelersModel> getPages(
      @Query("page") int page,
      @Query("size") int size
      );
}