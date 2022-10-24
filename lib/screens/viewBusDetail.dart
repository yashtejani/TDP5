import 'package:flutter/material.dart';
import 'package:project/mock/mockBusDetailList.dart';
import 'dart:developer';

import '../model/bus_detail_list_item.dart';
import '../services/bus_service.dart';

class ViewBusDetail extends StatefulWidget {
  const ViewBusDetail({Key? key}) : super(key: key);

  @override
  _ViewBusDetailState createState() => _ViewBusDetailState();
}

class _ViewBusDetailState extends State<ViewBusDetail> {
  final List<BustDetailListItem> busList = MockBusDetailList.FetchAny();
  String busId = "Bus No : ";
  var capacity;
  var occupied;
  var bid = 1;
  String seats = "Available Seats : ";
  @override
  void initState() {
    super.initState();
    fetchBusDetails(bid);
  }

  void fetchBusDetails(bid) async {
    BusService().getBusDetails(bid).then((val) {
      if (val['success']) {
        busId = busId + val['bus_info']['busId'].toString();
        capacity = val['bus_info']['capacity'];
        occupied = val['bus_info']['occupied_seats'];
        seats = seats + (capacity - occupied).toString();
      }
    });
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

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
              Text(busId, style: const TextStyle(height: 2, fontSize: 18)),
              Text(seats, style: const TextStyle(height: 2, fontSize: 18)),
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
