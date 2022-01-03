import 'package:flutter/material.dart';
import 'package:flutter_t/travelers/bloc/travelers_bloc.dart';
import 'package:flutter_t/travelers/bloc/travelers_event.dart';
import 'package:flutter_t/travelers/bloc/travelers_state.dart';
import 'package:flutter_t/travelers/ui/list_travelers_item_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListTravelersWidget extends StatelessWidget {
  TravelersLoadedState state;
  TravelersBloc travelersBloc;

  ListTravelersWidget({Key? key, required this.state, required this.travelersBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: state.refreshController,
      enablePullUp: true,
      onRefresh: () {
        travelersBloc.add(TravelersLoadEvent());
      },
      onLoading: () {
        travelersBloc.add(TravelersLoadingEvent());
      },
      child: ListView.separated(
        itemBuilder: (context, index) {
          final traveler = state.loadedTraveler[index];
          return ListTravelersItemWidget(traveler: traveler);
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: state.loadedTraveler.length,
      ),
    );
  }
}
