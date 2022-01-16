import 'package:dio/dio.dart';
import 'package:flutter_t/travelers/data/travelers_client.dart';
import 'package:flutter_t/travelers/models/traveler.dart';
import 'package:flutter_t/travelers/models/travelers.dart';

class TravelersRepository {
  static final dio = Dio();
  final client = TravelersClient(dio);

  Future<List<Traveler>> getTravelers(int p) async {
    TravelersPage page = await client.getPages(p, 10);
    return page.travelers;
  }

  Future<int> getTotalPage(int p) async {
    TravelersPage page = await client.getPages(p, 10);
    return page.totalPages;
  }
}
