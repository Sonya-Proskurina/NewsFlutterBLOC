import 'package:dartz/dartz.dart';
import 'package:flutter_t/core/error/failures.dart';
import 'package:flutter_t/feature_travelers/domain/entities/traveler_entities.dart';

abstract class TravelersRepository {
  Future<Either<Failure, List<TravelerEntities>>> getTravelers(int page);
  Future<Either<Failure, int>> getTotalPage();
}