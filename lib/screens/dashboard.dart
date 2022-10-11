import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project/screens/journey_planner.dart';
import 'package:project/mock/mock_bus_list.dart';
import 'package:project/widgets/circle_gradient_icon.dart';
import 'package:project/widgets/task_group.dart';
import 'package:project/core/res/color.dart';

import '../model/bus_list_item.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BusListItem> mockBusList = MockBusList.FetchAny();
    return Scaffold(
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
            ),
            Positioned(
              bottom: 30,
              // left: 100.w / 2 - (70 / 2),
              right: 30,
              child: CircleGradientIcon(
                color: Colors.pink,
                onTap: () {},
                size: 60,
                iconSize: 30,
                icon: Icons.add,
              ),
            )
          ],
        ));
  }

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
