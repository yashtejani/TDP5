import 'package:flutter/material.dart';
import 'package:project/screens/addStaff.dart';
import '../widgets/circle_gradient_icon.dart';
import '../widgets/screen_display.dart';
import '../widgets/searchbar.dart';
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
          title: const Text('Admin'),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            const SearchBar(),
            const SizedBox(
              height: 20,
            ),
            WidgetButton(
              title: "Add Staff",
              color: Colors.blue,
              icon: Icons.list,
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
          ],
        ));
  }
}
