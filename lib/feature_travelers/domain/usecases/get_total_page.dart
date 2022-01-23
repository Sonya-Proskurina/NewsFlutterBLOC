import 'package:dartz/dartz.dart';
import 'package:flutter_t/core/error/failures.dart';
import 'package:flutter_t/core/usecases/params.dart';
import 'package:flutter_t/core/usecases/usecase.dart';
import 'package:flutter_t/feature_travelers/domain/repositories/travelers_repositories.dart';

class GetTotalPage extends UseCase<int, GetTotalPageParams> {
  TravelersRepository travelersRepository;

  GetTotalPage({required this.travelersRepository});

  @override
  Future<Either<Failure, int>> call(GetTotalPageParams params) {
    return travelersRepository.getTotalPage();
  }
}

class GetTotalPageParams extends MainParams {
  @override
  List<Object?> get props => [];
}