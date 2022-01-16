// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traveler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Traveler _$TravelerFromJson(Map<String, dynamic> json) => Traveler(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'No name',
      trips: json['trips'] as int? ?? 0,
    );

Map<String, dynamic> _$TravelerToJson(Traveler instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'trips': instance.trips,
    };
