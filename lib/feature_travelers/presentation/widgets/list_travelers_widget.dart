import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_bloc.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_event.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_state.dart';
import 'package:flutter_t/feature_travelers/presentation/widgets/list_travelers_item_widget.dart';
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
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body ;
          if(mode==LoadStatus.idle){
            body =  const Text("");
          }
          else if(mode==LoadStatus.loading){
            body =  const CupertinoActivityIndicator();
          }
          else if(mode == LoadStatus.failed){
            body = const Text("Ошибка загрузки");
          }
          else if(mode == LoadStatus.canLoading){
            body = const Text("");
          }
          else{
            body = const Text("Новости кончились :)");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child:body),
          );
      },
      ),
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
