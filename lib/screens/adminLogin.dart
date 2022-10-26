import 'package:flutter/material.dart';
import 'package:project/screens/admin.dart';

import '../widgets/screen_display.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,

        child: SafeArea(

          child: Scaffold(
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
                title: const Text('Admin Login'),
              ),
            body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/admin.png',
                      height: 320,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),

                      child:

                      TextField(
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
                                  title: 'Bus replacing train', home: Admin())));
                        },
                        icon: const Icon(Icons.login), //icon data for elevated button
                        label: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white)), //label text
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
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
                  ],)
            )

          )
        )
    );


  }
}
