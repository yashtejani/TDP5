import 'package:flutter/material.dart';
import 'package:project/mock/mock_bus_list.dart';
import 'package:project/screens/dashboard.dart';
import '../model/bus_list_item.dart';
import 'admin.dart';

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
              backgroundColor: Colors.green[600],

              titleSpacing: 00.0,
              centerTitle: true,
              toolbarHeight: 70,
              toolbarOpacity: 0.8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
          title: const Text('Admin'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MaterialApp(
                    title: 'My Flutter App', home: Admin()))),
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
                   ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Report generated'),
                      backgroundColor: Colors.green,
                      margin: EdgeInsets.all(60),
                      behavior: SnackBarBehavior.floating,
                      elevation: 6,
                    ),
                  );
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