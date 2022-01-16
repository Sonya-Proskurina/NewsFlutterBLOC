import 'package:json_annotation/json_annotation.dart';
part 'traveler.g.dart';

@JsonSerializable()
class Traveler {
  String id;
  @JsonKey(defaultValue: "No name")
  String name;
  @JsonKey(defaultValue: 0)
  int trips;

  Traveler({
    required this.id,
    required this.name,
    required this.trips,
  });

  factory Traveler.fromJson(Map<String, dynamic> json) => _$TravelerFromJson(json);
  Map<String, dynamic> toJson() => _$TravelerToJson(this);
}