import 'package:equatable/equatable.dart';

class NewsEntities extends Equatable{
  int id;
  String title;
  String body;

  NewsEntities({required this.id, required this.title, required this.body});

  @override
  List<Object?> get props => [
    id,
    title,
    body
  ];
}