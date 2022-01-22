import 'package:flutter_t/feature_news/domain/entities/news_entities.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends NewsEntities{

  NewsModel(int id, String title, String body):super(id: id, title: title, body: body);

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}