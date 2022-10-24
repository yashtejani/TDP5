import 'package:flutter/material.dart';
import 'package:project/mock/mockBusDetailList.dart';

import '../model/bus_detail_list_item.dart';
import '../services/bus_service.dart';

class ViewBusDetail extends StatelessWidget {
  ViewBusDetail({super.key});
  final List<BustDetailListItem> busList = MockBusDetailList.FetchAny();
  String busId = "Bus No : ";
  var capacity;
  var occupied;
  String seats = "Available Seats : ";

  @override
  Widget build(BuildContext context) {
    fetchBusDetails(bId) async {
      BusService().getBusDetails(bId).then((val) {
        print(val);
        if (val['success']) {
          busId = busId + val['bus_info']['busId'].toString();
          capacity = val['bus_info']['capacity'];
          occupied = val['bus_info']['occupied_seats'];
          seats = seats + (capacity - occupied).toString();
        }
        ;
      });
    }

    // TODO
    @override
    void initState() {
      var bId = 1;
      fetchBusDetails(bId);
    }

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
              const Text(
                "Updated 5 min ago",
                style: TextStyle(height: 5, fontSize: 18),
              ),
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
              Text(busId, style: TextStyle(height: 2, fontSize: 18)),
              Text(seats, style: TextStyle(height: 2, fontSize: 18)),
              Expanded(
                  child: ListView.builder(
                      itemCount: busList.length,
                      itemBuilder: ((context, index) {
                        final item = busList[index];
                        return ListTile(
                          title: item.buildTime(context),
                          subtitle: item.buildBusNo(context),
                        );
                      }))),
            ],
          ),
        ),
      ),
    );
  }
}
