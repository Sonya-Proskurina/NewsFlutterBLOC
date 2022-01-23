import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/feature_travelers/domain/entities/traveler_entities.dart';
import 'package:flutter_t/feature_travelers/domain/repositories/travelers_repositories.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_event.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TravelersBloc extends Bloc<TravelersEvent, TravelersState> {
  final TravelersRepository travelersRepository;
  final RefreshController refreshController;
  int currentPage = 1;
  late int totalPage;
  List<TravelerEntities> _loadedTravelersList = [];

  TravelersBloc(
      {required this.travelersRepository, required this.refreshController})
      : super(TravelersLoadingState()) {
    on<TravelersLoadEvent>((event, emit) async {
      emit(TravelersLoadingState());
      currentPage = 1;

      final loadTotalPage = await travelersRepository.getTotalPage();
      loadTotalPage.fold((l) => emit(TravelersErrorState()), (r) {
        totalPage = r;
      });

      final loadTravelers = await travelersRepository.getTravelers(currentPage);
      loadTravelers.fold((l) => emit(TravelersErrorState()), (r) {
        _loadedTravelersList = r;
      });

      if (state != TravelersErrorState()) {
        refreshController.refreshCompleted();
        refreshController.loadComplete();
        emit(TravelersLoadedState(
            loadedTraveler: _loadedTravelersList,
            refreshController: refreshController));
      }

    });

    on<TravelersLoadingEvent>((event, emit) async {
      if (currentPage >= totalPage) {
        refreshController.loadNoData();
        emit(TravelersLoadedState(
            loadedTraveler: _loadedTravelersList,
            refreshController: refreshController));
      } else {
          currentPage++;
          final loadTravelers = await travelersRepository.getTravelers(currentPage);
          loadTravelers.fold((l) => emit(TravelersErrorState()), (r) {
            _loadedTravelersList = r;
          });

          if (state!=TravelersErrorState()) {
            refreshController.loadComplete();
            emit(TravelersLoadedState(
                loadedTraveler: _loadedTravelersList,
                refreshController: refreshController));
          }
      }

    });
  }
}
