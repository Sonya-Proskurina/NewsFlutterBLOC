import 'package:flutter/material.dart';
import 'package:flutter_t/travelers/models/traveler.dart';

class ListTravelersItemWidget extends StatelessWidget {
  Traveler traveler;
  ListTravelersItemWidget({Key? key, required this.traveler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Имя: " + traveler.name.toString()),
      subtitle: Text("Количество поездок: " + traveler.trips.toString()),
    );
  }
}
