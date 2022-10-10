import 'package:flutter/material.dart';
import 'package:project/screens/journey_planner.dart';
import 'package:project/mock/mock_bus_list.dart';

import '../model/bus_list_item.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BusListItem> mockBusList = MockBusList.FetchAny();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MaterialApp(
                          title: 'Bus replacing train',
                          home: JourneyPlanner(mockBusList))));
                },
                child: const Text('JourneyPlanner'))
          ],
        ));
  }
}
