import 'package:flutter_t/feature_travelers/data/models/traveler_model.dart';
import 'package:flutter_t/feature_travelers/domain/entities/traveler_entities.dart';
import 'package:flutter_t/feature_travelers/domain/entities/travelers_entities.dart';
import 'package:json_annotation/json_annotation.dart';
part 'travelers_model.g.dart';

@JsonSerializable()
class TravelersModel extends TravelersEntities {
  @JsonKey(name: 'data')
  late List<TravelerModel> travelersModel;
  @JsonKey(ignore: true)
  late List<TravelerEntities> travelers;

  static List<TravelerEntities> mapList(List<TravelerModel> list) {
    List<TravelerEntities> listEntities = List.generate(
        list.length,
        (int index) => TravelerEntities(
            id: list[index].id,
            name: list[index].id,
            trips: list[index].trips));
    return listEntities;
  }

  TravelersModel({required int totalPages, required this.travelersModel})
      : super(totalPages: totalPages, travelers: mapList(travelersModel));

  factory TravelersModel.fromJson(Map<String, dynamic> json) => _$TravelersModelFromJson(json);
  Map<String, dynamic> toJson() => _$TravelersModelToJson(this);
}
