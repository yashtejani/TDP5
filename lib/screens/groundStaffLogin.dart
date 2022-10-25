import 'package:flutter/material.dart';
import 'package:project/screens/admin.dart';
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
            WidgetButton(
              title: "Login",
              color: Colors.blue,
              icon: Icons.login,
              screen: const GroundStaffLogin(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MaterialApp(
                        title: 'Bus replacing train', home: Dashboard())));
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
