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
            const SizedBox(
              height: 20,
            ),
            WidgetButton(
              title: "Login",
              color: Colors.blue,
              icon: Icons.list,
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
