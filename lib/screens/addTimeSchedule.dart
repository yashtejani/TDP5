/*import 'package:flutter/material.dart';
import 'package:tdp/menu.dart';
import 'package:tdp/model/staff.dart';

class TimeSchedule extends StatefulWidget {
  const TimeSchedule({Key? key}) : super(key: key);

  @override
  TimeScheduleState createState() => TimeScheduleState();
}

class TimeScheduleState extends State {
  final staffIDController = TextEditingController();
  final passwordController = TextEditingController();
  final contactNoController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //build method
    final staffID = TextField(
      obscureText: false,
      controller: staffIDController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "StaffID Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final password = TextField(
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final contactNo = TextField(
      obscureText: false,
      controller: contactNoController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mobile Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final address = TextField(
      obscureText: false,
      controller: addressController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Address Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final postalCode = TextField(
      obscureText: false,
      controller: postalCodeController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "postal code Here",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final addButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
        onPressed: () {
          User user = User();
          user.staffID = staffIDController.text;
          user.password = passwordController.text;
          user.contactNo = contactNoController.text;
          user.address = addressController.text;
          user.postalCode = postalCodeController.text;

          showAlertDialog(context, user);
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

      body: Column(
        children: [
          MyAppBar(
            title: Text(
              'Add Staff',
              style: Theme.of(context) //
                  .primaryTextTheme
                  .headline6,
            ),
          ),
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
                    staffID,
                    const SizedBox(height: 25.0),
                    password,
                    const SizedBox(height: 5.0),
                    const Text("Contact details",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(180, 3, 1, 28),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    const SizedBox(height: 25.0),
                    contactNo,
                    const SizedBox(height: 25.0),
                    address,
                    const SizedBox(height: 25.0),
                    postalCode,
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

showAlertDialog(BuildContext context, User user) {
  Widget gotIt = TextButton(
    child: const Text("Got It"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop('alert');
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("My Information"),
    content: Text('${user.staffID}\n${user.password}\n${user.contactNo}'),
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
*/