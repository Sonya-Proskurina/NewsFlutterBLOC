import 'dart:convert';

TravelersPage travelersPageFromJson(String str) => TravelersPage.fromJson(json.decode(str));

class TravelersPage {
  int totalPages;
  List<Traveler> travelers;

  TravelersPage({
    required this.totalPages,
    required this.travelers,
  });

  factory TravelersPage.fromJson(Map<String, dynamic> json) => TravelersPage(
        totalPages: json['totalPages'],
        travelers:
            List<Traveler>.from(json['data'].map((x) => Traveler.fromJson(x))),
      );
}

class Traveler {
  String id;
  String? name;
  int? trips;

  Traveler({
    required this.id,
    required this.name,
    required this.trips,
  });

  factory Traveler.fromJson(Map<String, dynamic> json) => Traveler(
        id: json['_id'],
        name: json['name']??"No name",
        trips: json['trips']??0,
      );
}
