import 'package:flutter/material.dart';
import 'package:project/journey_planner.dart';
import 'package:project/mock/mock_bus_list.dart';

import 'model/bus_list_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BusListItem> mockBusList = MockBusList.FetchAny();
    return MaterialApp(title: 'Bus replacing train', home: JourneyPlanner(mockBusList));
  }
}


