import 'package:flutter_t/feature_travelers/domain/entities/traveler_entities.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class TravelersState {}

class TravelersLoadingState extends TravelersState {}

class TravelersLoadedState extends TravelersState {
  List<TravelerEntities> loadedTraveler;
  RefreshController refreshController;
  TravelersLoadedState({required this.loadedTraveler, required this.refreshController});
}

class TravelersErrorState extends TravelersState {}

class TravelersEndState extends TravelersState {}