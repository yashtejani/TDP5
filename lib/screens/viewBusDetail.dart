import 'package:flutter/material.dart';
import 'package:project/mock/mockBusDetailList.dart';
import 'package:project/screens/busList.dart';
import 'package:project/screens/updateBusDetails.dart';
import 'dart:developer';
import '../core/res/color.dart';

import '../model/bus_detail_list_item.dart';
import '../services/bus_service.dart';
import '../widgets/screen_display.dart';

class ViewBusDetail extends StatefulWidget {
  const ViewBusDetail({Key? key}) : super(key: key);

  @override
  _ViewBusDetailState createState() => _ViewBusDetailState();
}

class _ViewBusDetailState extends State<ViewBusDetail> {
  final List<BustDetailListItem> busList = MockBusDetailList.FetchAny();
  String arriveTime = "Arrived at : 11:30  ";
  String departTime = "Depart at  : 15:30 ";
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
        elevation: 15,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  const MaterialApp(title: 'My Flutter App', home: BusList()))),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            "Updated 5 min ago",
            style: TextStyle(height: 5, fontSize: 18),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(5),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MaterialApp(
                        title: 'Bus replacing train', home: UpdateBus())));
              },
              icon: const Icon(Icons.update), //icon data for elevated button
              label: const Text("Update"), //label text
              style: ElevatedButton.styleFrom(
                  primary: Colors.green //elevated btton background color
                  ),
            ),
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
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(color: Colors.green),
            child: Text(arriveTime,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1,
                  color: Colors.white,
                )),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(color: Colors.orange),
            child: Text(departTime,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1,
                  color: Colors.white,
                )),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(color: Colors.yellow),
            child: Text(busId,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1,
                  color: Colors.black,
                )),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(color: Colors.yellow),
            child: Text(seats,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1,
                  color: Colors.black,
                )),
          ),
          Expanded(
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: ListView.builder(
                      itemCount: busList.length,
                      itemBuilder: ((context, index) {
                        final item = busList[index];
                        return Card(
                          color: const Color.fromARGB(255, 192, 203, 218),
                          elevation: 2,
                          child: ListTile(
                            textColor: Colors.black,
                            leading: const Icon(Icons.bus_alert_sharp),
                            title: item.buildTime(context),
                            subtitle: item.buildBusNo(context),
                            dense: true,
                          ),
                        );
                      }))))
        ],
      ),
    );
  }
}
