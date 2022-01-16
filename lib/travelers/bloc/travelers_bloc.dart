import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/travelers/bloc/travelers_event.dart';
import 'package:flutter_t/travelers/bloc/travelers_state.dart';
import 'package:flutter_t/travelers/data/travelers_repository.dart';
import 'package:flutter_t/travelers/models/traveler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TravelersBloc extends Bloc<TravelersEvent, TravelersState> {
  final TravelersRepository travelersRepository;
  int currentPage = 1;
  late int totalPage;
  final RefreshController refreshController = RefreshController();
  List<Traveler> _loadedTravelersList = [];

  TravelersBloc(this.travelersRepository) : super(TravelersLoadingState()) {
    on<TravelersLoadEvent>((event, emit) async {
      emit(TravelersLoadingState());
      try {
        currentPage = 1;
        totalPage = await travelersRepository.getTotalPage(currentPage);
        _loadedTravelersList =
            await travelersRepository.getTravelers(currentPage);
        refreshController.refreshCompleted();
        refreshController.loadComplete();
        emit(TravelersLoadedState(
            loadedTraveler: _loadedTravelersList,
            refreshController: refreshController));
      } catch (e) {
        print(e);
        emit(TravelersErrorState());
      }
    });

    on<TravelersLoadingEvent>((event, emit) async {
      if (currentPage >= totalPage) {
        refreshController.loadNoData();
        emit(TravelersLoadedState(
            loadedTraveler: _loadedTravelersList,
            refreshController: refreshController));
      } else {
        try {
          currentPage++;
          _loadedTravelersList
              .addAll(await travelersRepository.getTravelers(currentPage));
          refreshController.loadComplete();
          emit(TravelersLoadedState(
              loadedTraveler: _loadedTravelersList,
              refreshController: refreshController));
        } catch (_) {
          emit(TravelersErrorState());
        }
      }
    });
  }
}
