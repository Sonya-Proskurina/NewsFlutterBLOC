import 'package:flutter_t/travelers/models/traveler.dart';
import 'package:json_annotation/json_annotation.dart';
part 'travelers.g.dart';

@JsonSerializable()
class TravelersPage {
  int totalPages;
  @JsonKey(name: 'data')
  List<Traveler> travelers;

  TravelersPage({
    required this.totalPages,
    required this.travelers,
  });

  factory TravelersPage.fromJson(Map<String, dynamic> json) => _$TravelersPageFromJson(json);
  Map<String, dynamic> toJson() => _$TravelersPageToJson(this);
}
