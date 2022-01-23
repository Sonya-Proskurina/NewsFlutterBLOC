import 'package:flutter_t/feature_travelers/domain/entities/traveler_entities.dart';

class TravelersEntities {
  int totalPages;
  List<TravelerEntities> travelers;

  TravelersEntities({
    required this.totalPages,
    required this.travelers,
  });
}
