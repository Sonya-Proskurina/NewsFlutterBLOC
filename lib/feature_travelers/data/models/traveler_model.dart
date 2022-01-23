import 'package:json_annotation/json_annotation.dart';
part 'traveler_model.g.dart';

@JsonSerializable()
class TravelerModel {
  String id;
  @JsonKey(defaultValue: "No name")
  late String name;
  @JsonKey(defaultValue: 0)
  late int trips;

  TravelerModel({
    required this.id,
    required this.name,
    required this.trips,
  });

  factory TravelerModel.fromJson(Map<String, dynamic> json) => _$TravelerModelFromJson(json);
  Map<String, dynamic> toJson() => _$TravelerModelToJson(this);
}