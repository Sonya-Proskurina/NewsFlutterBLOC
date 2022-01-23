import 'package:dartz/dartz.dart';
import 'package:flutter_t/core/error/failures.dart';
import 'package:flutter_t/core/usecases/params.dart';
import 'package:flutter_t/core/usecases/usecase.dart';
import 'package:flutter_t/feature_travelers/domain/entities/traveler_entities.dart';
import 'package:flutter_t/feature_travelers/domain/repositories/travelers_repositories.dart';

class GetTravelers extends UseCase<List<TravelerEntities>,GetTravelersParams> {
  final TravelersRepository travelersRepository;

  GetTravelers({required this.travelersRepository});

  @override
  Future<Either<Failure, List<TravelerEntities>>> call(GetTravelersParams params) {
    return travelersRepository.getTravelers(params.page);
  }
}

class GetTravelersParams extends MainParams {
  int page;

  GetTravelersParams({required this.page});

  @override
  List<Object?> get props => [
    page,
  ];
}