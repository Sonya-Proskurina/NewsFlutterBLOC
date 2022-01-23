// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traveler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelerModel _$TravelerModelFromJson(Map<String, dynamic> json) =>
    TravelerModel(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'No name',
      trips: json['trips'] as int? ?? 0,
    );

Map<String, dynamic> _$TravelerModelToJson(TravelerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'trips': instance.trips,
    };
