import 'package:flutter/material.dart';
import 'package:project/screens/generateReport.dart';
import 'package:project/screens/search.dart';
import 'package:project/screens/notificationView.dart';
import 'package:project/mock/mock_bus_list.dart';
import 'package:project/screens/updateBusDetails.dart';
import '../widgets/searchbar.dart';
import '../widgets/screen_display.dart';
import '../model/bus_list_item.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    final List<BusListItem> mockBusList = MockBusList.FetchAny();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 70,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          title: Text("Dashboard"),
          elevation: 15,
          leading:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              /*
              child: InkWell(
                onTap: () {},
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.menu,
                ),
              ),
              */
            ),
          ),
        ),

        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            /* WidgetButton(
              title: "Journey Planner",
              color: Colors.blue,
              icon: Icons.route_outlined,
              screen: JourneyPlanner(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train', home: JourneyPlanner())));
              },
            ), */
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(140),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage("assets/images/Profile.png"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ground Staff  ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18,
            ),
            Text("@ Stop103"),
            SizedBox(
              height: 20,
            ),

            WidgetButton(
              title: "Update Bus Information",
              color: Colors.green,
              icon: Icons.departure_board_outlined,
              screen: UpdateBus(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MaterialApp(
                        title: 'Bus replacing train', home: UpdateBus())));
              },
            ),
            WidgetButton(
              title: "View Report",
              color: Colors.green,

              icon: Icons.library_books_sharp,
              screen: JourneyPlanner(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train', home: GenerateReport())));
              },
            ),
            WidgetButton(
              title: "Notifications",
              color: Colors.green,

              icon: Icons.notification_add,
              screen: NotificationView(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train', home: NotificationView())));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            /*
            Positioned(
              bottom: 30,
              // left: 100.w / 2 - (70 / 2),
              right: 30,
              child: CircleGradientIcon(
                color: Colors.indigo,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MaterialApp(
                          title: 'Bus replacing train',
                          home: JourneyPlanner())));
                },
                size: 60,
                iconSize: 30,
                icon: Icons.menu,
              ),


            )

             */
          ],
        ));
  }
}



