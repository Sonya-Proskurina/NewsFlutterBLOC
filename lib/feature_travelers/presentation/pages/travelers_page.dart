import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/feature_travelers/domain/usecases/get_total_page.dart';
import 'package:flutter_t/feature_travelers/domain/usecases/get_travelers.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_bloc.dart';
import 'package:flutter_t/feature_travelers/presentation/pages/travelers_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TravelersPage extends StatelessWidget {

  TravelersPage({Key? key, required this.getTravelers, required this.getTotalPage, required this.refreshController}) : super(key: key);
  final GetTravelers getTravelers;
  final GetTotalPage getTotalPage;
  final RefreshController refreshController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TravelersBloc>(
        create: (context) => TravelersBloc(getTotalPage: getTotalPage, getTravelers: getTravelers, refreshController: refreshController),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigoAccent,
            title: const Text("Путешественники"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: const TravelersScreen(),
        )
    );
  }
}

