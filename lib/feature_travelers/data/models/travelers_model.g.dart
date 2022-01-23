// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travelers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelersModel _$TravelersModelFromJson(Map<String, dynamic> json) =>
    TravelersModel(
      totalPages: json['totalPages'] as int,
      travelersModel: (json['data'] as List<dynamic>)
          .map((e) => TravelerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TravelersModelToJson(TravelersModel instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'data': instance.travelersModel,
    };
