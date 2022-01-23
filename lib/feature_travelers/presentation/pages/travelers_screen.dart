import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_bloc.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_event.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_state.dart';
import 'package:flutter_t/feature_travelers/presentation/widgets/error_widget.dart';
import 'package:flutter_t/feature_travelers/presentation/widgets/list_travelers_widget.dart';
import 'package:flutter_t/feature_travelers/presentation/widgets/loading_widget.dart';

class TravelersScreen extends StatefulWidget {
  const TravelersScreen({Key? key}) : super(key: key);

  @override
  _TravelersScreenState createState() => _TravelersScreenState();
}

class _TravelersScreenState extends State<TravelersScreen> {
  @override
  Widget build(BuildContext context) {
    final TravelersBloc travelersBloc = context.read<TravelersBloc>();
    travelersBloc.add(TravelersLoadEvent());
    return BlocBuilder<TravelersBloc, TravelersState>(
        builder: (context, state) {
      if (state is TravelersLoadingState) {
        return const LoadingWidget();
      } else if (state is TravelersLoadedState) {
        return ListTravelersWidget(state: state, travelersBloc: travelersBloc);
      } else {
        return const ErrorListWidget();
      }
    });
  }
}
