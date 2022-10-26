import 'package:flutter/material.dart';
import 'package:project/model/time_schedule.dart';
import 'package:project/screens/admin.dart';
import 'package:project/screens/homeScreen.dart';

class TimeSchedule extends StatefulWidget {
  const TimeSchedule({Key? key}) : super(key: key);

  @override
  TimeScheduleState createState() => TimeScheduleState();
}

class TimeScheduleState extends State {
  final slotIDController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //build method
    final slotID = TextField(
      obscureText: false,
      controller: slotIDController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Slot ID Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final startTime = TextField(
      obscureText: false,
      controller: startTimeController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "start time Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final endTime = TextField(
      obscureText: false,
      controller: endTimeController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "End Time Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final addButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
        onPressed: () {
          Timetable timeSchedule = Timetable();
          timeSchedule.slotID = slotIDController.text;
          timeSchedule.startTime = startTimeController.text;
          timeSchedule.endTime = endTimeController.text;
          showAlertDialog(context, timeSchedule);
        },
        child: const Text(
          "Add",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    return Scaffold(
      //appBar: AppBar(title: const Text("Add Staff")),
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
        title: const Text('Time Schedule'),
        automaticallyImplyLeading: false,
        // ignore: unnecessary_new
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  const MaterialApp(title: 'My Flutter App', home: Admin()))),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25.0),
                    slotID,
                    const SizedBox(height: 5.0),
                    const Text("Time Schedule",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(180, 3, 1, 28),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    const SizedBox(height: 25.0),
                    startTime,
                    const SizedBox(height: 25.0),
                    endTime,
                    const SizedBox(
                      height: 15.0,
                    ),
                    addButon,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context, Timetable timeSchedule) {
  Widget gotIt = TextButton(
    child: const Text("Got It"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('alert');
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Time Schedule"),
    content: Text(
        'Slot ID :  ${timeSchedule.slotID}\nStart Time :  ${timeSchedule.startTime}\nEnd Time :  ${timeSchedule.endTime}'),
    actions: [
      gotIt,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
