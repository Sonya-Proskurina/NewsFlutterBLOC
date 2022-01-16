// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travelers.dart';

// **************************************************************************
// JsonSerializableGenerator
// ******************************************************п********************

TravelersPage _$TravelersPageFromJson(Map<String, dynamic> json) =>
    TravelersPage(
      totalPages: json['totalPages'] as int,
      travelers: (json['data'] as List<dynamic>)
          .map((e) => Traveler.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TravelersPageToJson(TravelersPage instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'data': instance.travelers,
    };
