import 'package:dartz/dartz.dart';
import 'package:flutter_t/core/constants/constants.dart';
import 'package:flutter_t/core/error/failures.dart';
import 'package:flutter_t/feature_travelers/data/datasources/traveler_datasours.dart';
import 'package:flutter_t/feature_travelers/domain/entities/traveler_entities.dart';
import 'package:flutter_t/feature_travelers/data/models/travelers_model.dart';
import 'package:flutter_t/feature_travelers/domain/repositories/travelers_repositories.dart';

class TravelersRepositoriesImpl extends TravelersRepository {
  final TravelersDataSours travelersDataSours;

  TravelersRepositoriesImpl({required this.travelersDataSours});

  @override
  Future<Either<Failure, int>> getTotalPage() async{
    try {
      final travelersEntities = await travelersDataSours.getPages(TRAVELERS_NUM_PAGE, TRAVELERS_PAGE_SIZE);
      return Right(travelersEntities.totalPages);
    }
    catch(e) {
      print("!SOS!- "+e.toString());
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TravelerEntities>>> getTravelers(int page) async {
    try {
      final travelersEntities = await travelersDataSours.getPages(page, TRAVELERS_PAGE_SIZE);
      return Right(TravelersModel.mapList(travelersEntities.travelers));
    }
    catch(e) {
      print("!SOS!- "+e.toString());
      return Left(ServerFailure());
    }
  }

}