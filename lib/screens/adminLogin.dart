import 'package:flutter/material.dart';
import 'package:project/screens/admin.dart';

import '../widgets/screen_display.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AdminLogin'),
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
              screen: AdminLogin(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MaterialApp(
                        title: 'Bus replacing train', home: Admin())));
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
