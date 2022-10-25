import 'package:flutter/material.dart';
import 'package:project/screens/admin.dart';
import 'package:project/screens/adminLogin.dart';
import 'package:project/screens/busList.dart';
import 'package:project/screens/dashboard.dart';
import 'package:project/screens/groundStaffLogin.dart';
import 'package:project/screens/journey_planner.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State {
  int currentIndex = 0;
  //need to change first to buslist screen instead of Admin
  final pageList = [
     const GroundStaffLogin(),
    JourneyPlanner(),
    const Dashboard(),
    const AdminLogin()
  ];
  @override
  Widget build(BuildContext context) {

    return CupertinoTabScaffold(

      tabBar: CupertinoTabBar(

        items: const [

          BottomNavigationBarItem(

            icon: Icon(CupertinoIcons.home),

            label: 'Home',

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.directions_walk),

            label: 'Journey Planner',

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.dashboard),

            label: 'Dashboard',

          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.computer),

            label: 'Admin',

          ),
        ],

      ),

      tabBuilder: (BuildContext context, int index) {

        return CupertinoTabView(

          builder: (BuildContext context) {

            if (index == 0 ){
              return const CupertinoPageScaffold(

                child: GroundStaffLogin(),

              );
            }
            else if (index ==1 ){
              return CupertinoPageScaffold(
                child: JourneyPlanner(),
              );
            }
            else if (index ==2){
              return const CupertinoPageScaffold(
                child: Dashboard(),
              );
            }
            else {
              return const CupertinoPageScaffold(
                child: AdminLogin(),
              );
            }

          },

        );

      },

    );

  }
}
