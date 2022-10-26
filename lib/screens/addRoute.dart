import 'package:flutter/material.dart';
import 'package:project/screens/admin.dart';

class AddRoute extends StatelessWidget {
  const AddRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Admin'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MaterialApp(
                      title: 'My Flutter App', home: Admin()))),
            )),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Route ID',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Starting Point',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Destination',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Routes eg, Richmond, Caulfield',
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Routes added'),
                      backgroundColor: Colors.green,
                      margin: EdgeInsets.all(60),
                      behavior: SnackBarBehavior.floating,
                      elevation: 6,
                    ),
                  );
                },
                icon: const Icon(Icons.login), //icon data for elevated button
                label: const Text("Add Route"), //label text
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
