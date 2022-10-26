import 'package:flutter/material.dart';
import 'package:project/mock/mock_bus_list.dart';
import 'package:project/screens/viewBusDetail.dart';
import '../model/bus_list_item.dart';
import '../widgets/searchbar.dart';

class JourneyPlanner extends StatelessWidget {
  final List<BusListItem> busList = MockBusList.FetchAny();

  // const JourneyPlanner(this.busList, {super.key});
  JourneyPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocationController = TextEditingController();
    final destinationController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Column(
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SearchBar()),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
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
                              onTap: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewBusDetail()),
                                );
                              }),
                            ),
                          );
                        }))))
          ],
        ));
  }
}
