import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_t/travelers/bloc/travelers_bloc.dart';
import 'package:flutter_t/travelers/data/travelers_repository.dart';
import 'package:flutter_t/travelers/ui/travelers_screen.dart';

class TravelersPage extends StatefulWidget {
  const TravelersPage({Key? key}) : super(key: key);

  @override
  _TravelersPageState createState() => _TravelersPageState();
}

class _TravelersPageState extends State<TravelersPage> {
  final travelersRepository = TravelersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TravelersBloc>(
        create: (context) => TravelersBloc(travelersRepository),
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
