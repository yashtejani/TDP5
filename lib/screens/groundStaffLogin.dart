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
          title: const Text('Ground Staff Login'),
        ),
        body: Column(

          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Enter Your Username',
                  labelText: 'Username',

                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Enter Your Password',
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password?',
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
                label: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white)), //label text
                style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
                    fixedSize: const Size(220, 60),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))
                  //elevated btton background color
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
