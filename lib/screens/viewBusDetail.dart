import 'package:flutter/material.dart';
import 'package:project/mock/mockBusDetailList.dart';

import '../model/bus_detail_list_item.dart';

class ViewBusDetail extends StatelessWidget {
  ViewBusDetail({super.key});
  final List<BustDetailListItem> busList = MockBusDetailList.FetchAny();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Bus Detail'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Image.asset('assets/images/map.png',
                    width: 300, height: 150, fit: BoxFit.fill),
              ),
              const Text("Bus no 1"),
              const Text("Seat available"),
              Expanded(
                  child: ListView.builder(
                      itemCount: busList.length,
                      itemBuilder: ((context, index) {
                        final item = busList[index];
                        return ListTile(
                          title: item.buildTime(context),
                          subtitle: item.buildBusNo(context),
                        );
                      })))
            ],
          ),
        ),
      ),
    );
  }
}
