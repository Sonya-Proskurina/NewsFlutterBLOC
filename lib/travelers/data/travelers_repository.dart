import 'package:flutter_t/travelers/data/travelers_provider.dart';
import 'package:flutter_t/travelers/models/travelers.dart';

class TravelersRepository {
  final TravelersProvider _travelersProvider = TravelersProvider();

  Future<List<Traveler>> getTravelers(int page) => _travelersProvider.getTravelers(page);
  Future<int> getTotalPage(int page) => _travelersProvider.getTotalPages(page);
}