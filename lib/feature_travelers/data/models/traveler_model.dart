import 'package:flutter_t/feature_travelers/domain/entities/traveler_entities.dart';
import 'package:json_annotation/json_annotation.dart';
part 'traveler_model.g.dart';

@JsonSerializable()
class TravelerModel extends TravelerEntities {
  @JsonKey(defaultValue: "No name")
  late String name;
  @JsonKey(defaultValue: 0)
  late int trips;

  TravelerModel({required String id, required String name, required int trips}) : super(id: id, name: name, trips: trips);

  factory TravelerModel.fromJson(Map<String, dynamic> json) => _$TravelerModelFromJson(json);
  Map<String, dynamic> toJson() => _$TravelerModelToJson(this);
}