import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/core/di/locator_service.dart';
import 'package:flutter_t/feature_travelers/presentation/bloc/travelers_bloc.dart';
import 'package:flutter_t/feature_travelers/presentation/pages/travelers_screen.dart';

class TravelersPage extends StatelessWidget {

  TravelersPage({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TravelersBloc>(
        create: (context) => sl<TravelersBloc>(),
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

