import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/feature_travelers/domain/entities/traveler_entities.dart';
import 'package:flutter_t/feature_travelers/domain/usecases/get_total_page.dart';
import 'package:flutter_t/feature_travelers/domain/usecases/get_travelers.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_event.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TravelersBloc extends Bloc<TravelersEvent, TravelersState> {
  final RefreshController refreshController;
  final GetTotalPage getTotalPage;
  final GetTravelers getTravelers;
  int currentPage = 1;
  late int totalPage;
  List<TravelerEntities> _loadedTravelersList = [];

  TravelersBloc({required this.getTotalPage, required this.getTravelers, required this.refreshController})
      : super(TravelersLoadingState()) {
    on<TravelersLoadEvent>((event, emit) async {
      emit(TravelersLoadingState());
      currentPage = 1;

      final loadTotalPage = await getTotalPage(GetTotalPageParams());
      loadTotalPage.fold((l) => emit(TravelersErrorState()), (r) {
        totalPage = r;
      });

      final loadTravelers = await getTravelers(GetTravelersParams(page: currentPage));
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
          final loadTravelers = await getTravelers(GetTravelersParams(page: currentPage));
          loadTravelers.fold((l) => emit(TravelersErrorState()), (r) {
            _loadedTravelersList.addAll(r);
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
