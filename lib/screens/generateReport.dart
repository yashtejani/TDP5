
import 'package:flutter/material.dart';
import 'package:project/journey_planner.dart';
import 'package:project/mock/mock_bus_list.dart';
import 'package:project/screens/dashboard.dart';
import 'package:project/screens/viewBusDetail.dart';
import '../model/bus_list_item.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/journey_planner.dart';
import 'package:project/screens/notificationView.dart';
import 'package:project/mock/mock_bus_list.dart';
import 'package:project/screens/updateBusDetails.dart';
import '../widgets/searchbar.dart';
import '../widgets/screen_display.dart';
import '../model/bus_list_item.dart';

class GenerateReport extends StatelessWidget {
  final List<BusListItem> busList = MockBusList.FetchAny();

  // const JourneyPlanner(this.busList, {super.key});
  GenerateReport({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocationController = TextEditingController();
    final destinationController = TextEditingController();

    return Scaffold(
          appBar: AppBar(
          title: const Text('Admin'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MaterialApp(
                    title: 'My Flutter App', home: Dashboard()))),
        )),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Date eg. 02/05/2022',
                ),
              ),
            ),
              Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MaterialApp(
                          title: 'Bus replacing train', home: Dashboard())));
                },
                icon: const Icon(Icons.login), //icon data for elevated button
                label: const Text("Download Report"), //label text
                style: ElevatedButton.styleFrom(
                    primary: Colors.green //elevated btton background color
                    ),
              ),
            ),
            
           
          ],
        ));
  }
}