import 'package:flutter/material.dart';
import 'package:project/screens/addRoute.dart';
import 'package:project/screens/addStaff.dart';
import 'package:project/screens/addTimeSchedule.dart';
import '../widgets/circle_gradient_icon.dart';
import '../widgets/screen_display.dart';
import 'package:project/screens/adminLogin.dart';

import 'package:flutter/src/material/bottom_navigation_bar.dart';

class Admin extends StatelessWidget {
  const Admin({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: AdminScreen(),
    );
  }
}

class AdminScreen extends StatefulWidget {
  @override
  State createState() {
    return _AdminState();
  }
}

class _AdminState extends State {
  @override
  Widget build(BuildContext context) {
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
                    title: 'My Flutter App', home: AdminLogin()))),
          ),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            WidgetButton(
              title: "Add Staff",
              color: Colors.green,
              icon: Icons.person_add,
              screen: AddStaff(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MaterialApp(
                        title: 'Bus replacing train', home: AddStaff())));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            WidgetButton(
              title: "Add route",
              color: Colors.green,
              icon: Icons.route,
              screen: AddRoute(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MaterialApp(
                        title: 'Bus replacing train', home: AddRoute())));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            WidgetButton(
              title: "Time Schedule",
              color: Colors.green,
              icon: Icons.add,
              screen: TimeSchedule(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MaterialApp(
                        title: 'Bus replacing train', home: TimeSchedule())));
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
