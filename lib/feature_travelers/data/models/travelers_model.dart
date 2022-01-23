import 'package:flutter_t/feature_travelers/data/models/traveler_model.dart';
import 'package:flutter_t/feature_travelers/domain/entities/traveler_entities.dart';
import 'package:json_annotation/json_annotation.dart';
part 'travelers_model.g.dart';

@JsonSerializable()
class TravelersModel {
  int totalPages;
  @JsonKey(name: 'data')
  List<TravelerModel> travelers;

  static List<TravelerEntities> mapList(List<TravelerModel> list) {
    List<TravelerEntities> listEntities = List.generate(
        list.length,
        (int index) => TravelerEntities(
            id: list[index].id,
            name: list[index].name,
            trips: list[index].trips));
    return listEntities;
  }

  TravelersModel({
    required this.totalPages,
    required this.travelers,
  });

  factory TravelersModel.fromJson(Map<String, dynamic> json) => _$TravelersModelFromJson(json);
  Map<String, dynamic> toJson() => _$TravelersModelToJson(this);
}
