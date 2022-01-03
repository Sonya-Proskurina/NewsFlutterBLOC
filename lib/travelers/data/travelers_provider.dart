import 'package:flutter_t/travelers/models/travelers.dart';
import 'package:http/http.dart' as http;

class TravelersProvider {
  Future<int> getTotalPages(int page) async {
    final response = await http.get(Uri.parse(
        'https://api.instantwebtools.net/v1/passenger?page=$page&size=10'));
    if (response.statusCode == 200) {
      final totalPages = travelersPageFromJson(response.body).totalPages;
      return totalPages;
    } else {
      throw Exception('Ошибка сети');
    }
  }

  Future<List<Traveler>> getTravelers(int page) async {
    final response = await http.get(Uri.parse(
        'https://api.instantwebtools.net/v1/passenger?page=$page&size=10'));

    if (response.statusCode == 200) {
      print(page);
      print(response.body + "\n");
      final travelers = travelersPageFromJson(response.body).travelers;
      return travelers;
    } else {
      throw Exception('Ошибка сети');
    }
  }
}
