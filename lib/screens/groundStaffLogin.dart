import 'package:flutter/material.dart';
import 'package:project/screens/admin.dart';
import 'package:project/screens/busList.dart';
import 'package:project/screens/dashboard.dart';

import '../widgets/screen_display.dart';

class GroundStaffLogin extends StatelessWidget {
  const GroundStaffLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GroundStaffLogin'),
        ),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter username',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter password',
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
                          title: 'Bus replacing train', home: BusList())));
                },
                icon: const Icon(Icons.login), //icon data for elevated button
                label: const Text("Login"), //label text
                style: ElevatedButton.styleFrom(
                    primary: Colors.green //elevated btton background color
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
