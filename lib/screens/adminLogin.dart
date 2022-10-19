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
            const SizedBox(
              height: 20,
            ),
            WidgetButton(
              title: "Login",
              color: Colors.blue,
              icon: Icons.list,
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
