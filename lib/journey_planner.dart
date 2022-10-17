import 'package:flutter/material.dart';

import 'model/bus_list_item.dart';

class JourneyPlanner extends StatelessWidget {
  final List<BusListItem> busList;

  const JourneyPlanner(this.busList, {super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocationController = TextEditingController();
    final destinationController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Journey planner'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
                controller: currentLocationController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Current location')),
            TextField(
                controller: destinationController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Destination')),
            ElevatedButton(
                onPressed: () => {
                  print(currentLocationController.text)
                },
                child: const Text('Search', style: TextStyle(fontSize: 20.0))),
            Expanded(
                child: ListView.builder(
                    itemCount: busList.length,
                    itemBuilder: ((context, index) {
                      final item = busList[index];
                      return ListTile(
                          title: item.buildTime(context),
                          subtitle: item.buildBusNo(context));
                    })))
          ],
        ));
  }
}
