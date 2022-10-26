import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/busList.dart';
import 'package:project/screens/viewBusDetail.dart';
import 'package:project/services/bus_service.dart';
import 'package:project/screens/dashboard.dart';

class UpdateBus extends StatelessWidget {
  const UpdateBus({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Update Bus Details';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MaterialApp(
                    title: 'My Flutter App',
                    home: ViewBusDetail(
                      bId: 1,
                    )))),
          ),
        ),
        body: const UpdateBusForm(),
      ),
    );
  }
}

// Create a Form widget.
class UpdateBusForm extends StatefulWidget {
  const UpdateBusForm({super.key});

  @override
  UpdateBusFormState createState() {
    return UpdateBusFormState();
  }
}

class UpdateBusFormState extends State<UpdateBusForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLoaded = true;
  List? data;
  TextEditingController busId = TextEditingController();
  TextEditingController availSeats = TextEditingController();
  var capacity;
  var occupied;
  String dropdownvalueroute = 'Hallam - Caulfield';
  var routeitems = [
    'Hallam - Caulfield',
    'Caulfield - Hallam',
    'Westall - Richmond',
    'Richmond - Westall'
  ];

  String dropdownvalueschedule = '8 AM - 9 AM';
  var scheduleitems = [
    '8 AM - 9 AM',
    '9 AM - 10 AM',
    '10 AM - 11 AM',
    '11 AM - 12 AM'
  ];

  fetchBusDetails(bId) async {
    BusService().getBusDetails(bId).then((val) {
      if (val['success']) {
        busId.text = val['bus_info']['busId'].toString();
        capacity = val['bus_info']['capacity'];
        occupied = val['bus_info']['occupied_seats'];
        availSeats.text = (capacity - occupied).toString();
      }
      ;
    });
    // var response = await http.get('http://localhost:3002/busList');
    // //    var response = await http
    // //        .get('https://rest-api-avi-seventeen-june.herokuapp.com/posts/listall');

    // print(response.body);
    // setState(() {
    //   data = jsonDecode(response.body);
    //   isLoaded = true;
    // });
  }

  @override
  void initState() {
    var bId = 1;
    //super.initState();
    fetchBusDetails(bId);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    data = null;
    isLoaded = false;
  }

  @override
  Widget build(BuildContext context) {
    int? passengerCount = 0;
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bus No',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: busId,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Current Station',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: TextEditingController(text: "Richmond"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Available Seats',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: availSeats,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Passengers',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onChanged: (val) {
                  passengerCount = int.tryParse(val);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  BusService()
                      .updateBusDeatails(busId.text, capacity, occupied,
                          passengerCount, null, null, "P")
                      .then((val) {
                    if (val['success']) {
                      print("Success");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Available Seats updated'),
                          backgroundColor: Colors.green,
                          margin: EdgeInsets.all(60),
                          behavior: SnackBarBehavior.floating,
                          elevation: 6,
                        ),
                      );
                      //TODO : Navigate to view bus details of the selected bus
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error Occured'),
                          backgroundColor: Colors.red,
                          margin: EdgeInsets.all(60),
                          behavior: SnackBarBehavior.floating,
                          elevation: 6,
                        ),
                      );
                    }
                    ;
                  });
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ));
  }
}
