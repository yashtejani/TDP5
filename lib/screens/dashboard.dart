import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project/screens/journey_planner.dart';
import 'package:project/mock/mock_bus_list.dart';
<<<<<<< Updated upstream
import 'package:project/widgets/circle_gradient_icon.dart';
import 'package:project/widgets/task_group.dart';
import 'package:project/core/res/color.dart';
=======
import '../widgets/searchbar.dart';
import '../widgets/screen_display.dart';
import '../model/bus_list_item.dart';
import 'package:project/widgets/circle_gradient_icon.dart';

>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
          children: [
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    _searchHeader(),
                    const SizedBox(
                      height: 15,
                    ),
                    buildGrid(),
                    const SizedBox(
                      height: 25,
                    ),
                    _bottomHeader(),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MaterialApp(
                                  title: 'Bus replacing train',
                                  home: JourneyPlanner(mockBusList))));
                        },
                        child: const Text('JourneyPlanner'))
                  ],
                ),
              ),
=======
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
              screen:  JourneyPlanner(mockBusList),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train',
                        home: JourneyPlanner(mockBusList))));
              },
            ),
            WidgetButton(
              title: "Update Bus Information",
              color: Colors.orange,
              icon: Icons.departure_board_outlined,
              screen:  JourneyPlanner(mockBusList),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train',
                        home: JourneyPlanner(mockBusList))));
              },
            ),
            WidgetButton(
              title: "View Report",
              color: Colors.green,

              icon: Icons.library_books_sharp,
              screen:  JourneyPlanner(mockBusList),
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
              screen:  JourneyPlanner(mockBusList),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train',
                        home: JourneyPlanner(mockBusList))));
              },
            ),
            const SizedBox(
              height: 20,
>>>>>>> Stashed changes
            ),
            Positioned(
              bottom: 30,
              // left: 100.w / 2 - (70 / 2),
              right: 30,
              child: CircleGradientIcon(
<<<<<<< Updated upstream
                color: Colors.pink,
                onTap: () {},
                size: 60,
                iconSize: 30,
                icon: Icons.add,
=======
                color: Colors.indigo,
                onTap: () {Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MaterialApp(
                        title: 'Bus replacing train',
                        home: JourneyPlanner(mockBusList))));},
                size: 60,
                iconSize: 30,
                icon: Icons.menu,
>>>>>>> Stashed changes
              ),
            )
          ],
        ));
  }

<<<<<<< Updated upstream
  Row _bottomHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Nearest Stops",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: Text(
            "See all",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }

  Row _searchHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SelectableText(
          "Search",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          toolbarOptions: const ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_outlined,
              size: 30,
              color: Colors.blue[400],
            ))
      ],
    );
  }

  StaggeredGrid buildGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: const [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.3,
          child: TaskGroupContainer(
            color: Colors.pink,
            icon: Icons.menu_book_rounded,
            taskCount: 10,
            taskGroup: "Studying",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: TaskGroupContainer(
            color: Colors.orange,
            isSmall: true,
            icon: Icons.mobile_friendly,
            taskCount: 5,
            taskGroup: "Mobile App Development",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.3,
          child: TaskGroupContainer(
            color: Colors.green,
            icon: Icons.article,
            taskCount: 2,
            taskGroup: "Blog",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: TaskGroupContainer(
            color: Colors.blue,
            isSmall: true,
            icon: Icons.single_bed_sharp,
            taskCount: 9,
            taskGroup: "Sleep",
          ),
        ),
      ],
    );
  }
}
=======

  }


>>>>>>> Stashed changes
