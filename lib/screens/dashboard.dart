import 'package:flutter/material.dart';
import 'package:project/screens/addBusDetails.dart';
import 'package:project/screens/journey_planner.dart';
import 'package:project/mock/mock_bus_list.dart';
import 'package:project/screens/updateBusDetails.dart';
import 'package:project/widgets/circle_gradient_icon.dart';
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
          title: Text("Dashboard"),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () {},
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.menu,
                ),
              ),
            ),
          ),
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
              title: "Journey Planner",
              color: Colors.blue,
              icon: Icons.route_outlined,
              screen: JourneyPlanner(mockBusList),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train',
                        home: JourneyPlanner(mockBusList))));
              },
            ),
            WidgetButton(
              title: "Add Bus Information",
              color: Colors.orange,
              icon: Icons.departure_board_outlined,
              screen: AddBus(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train', home: AddBus())));
              },
            ),
            WidgetButton(
              title: "Update Bus Information",
              color: Colors.orange,
              icon: Icons.departure_board_outlined,
              screen: UpdateBus(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train', home: UpdateBus())));
              },
            ),
            WidgetButton(
              title: "View Report",
              color: Colors.green,
              icon: Icons.library_books_sharp,
              screen: JourneyPlanner(mockBusList),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train',
                        home: JourneyPlanner(mockBusList))));
              },
            ),
            WidgetButton(
              title: "Notifications",
              color: Colors.pink,
              icon: Icons.notification_add,
              screen: JourneyPlanner(mockBusList),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train',
                        home: JourneyPlanner(mockBusList))));
              },
            ),
            const SizedBox(
              height: 20,
            ),
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
                          home: JourneyPlanner(mockBusList))));
                },
                size: 60,
                iconSize: 30,
                icon: Icons.menu,
              ),
            )
          ],
        ));
  }
}
