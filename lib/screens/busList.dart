import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/screens/homeScreen.dart';
import 'package:sizer/sizer.dart';
import '../core/res/color.dart';
import 'package:project/screens/viewBusDetail.dart';

import '../services/bus_service.dart';

class BusList extends StatelessWidget {
  const BusList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        shadowColor: Colors.blueAccent,
        title: const Text('Bus List'),
        elevation: 15,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  MaterialApp(title: 'My Flutter App', home: HomeScreen()))),
        ),
      ),
      extendBody: true,
      body: _buildBody(),
    );
  }

  Stack _buildBody() {
    return Stack(
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
                  height: 15,
                ),
                _busListHeader(),
                const SizedBox(
                  height: 15,
                ),
                const BusListDetail1(),
                const BusListDetail2(),
                const BusListDetail3(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _busListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text.rich(
          TextSpan(
              text: "Next buses at Stop 103 High St ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                ),
              ]),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: Text(
            "See all stops",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}

class BusListDetail1 extends StatelessWidget {
  const BusListDetail1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Route 35 to Glenferrie Station",
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: Colors.purple[300],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Arriving in 10mins",
                      style: TextStyle(
                        color: Colors.greenAccent[600],
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          BusService()
                              .updateBusDeatails(
                                  1, null, null, null, 1, null, "A")
                              .then((val) {
                            if (val['success']) {
                              print("Success");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.green,
                                  elevation: 6,
                                  content: Text('Arrival Time updated'),
                                  margin: EdgeInsets.all(60),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Error Occured'),
                                  backgroundColor: Colors.red,
                                  margin: EdgeInsets.all(60),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 6,
                                ),
                              );
                            }
                            ;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          backgroundColor: Colors.lightGreen,
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        child: const Text('Arrived',
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          BusService()
                              .updateBusDeatails(
                                  1, null, null, null, null, 1, "D")
                              .then((val) {
                            if (val['success']) {
                              print("Success");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Departure Time updated'),
                                  backgroundColor: Colors.green,
                                  margin: EdgeInsets.all(60),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 6,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Error Occured'),
                                  backgroundColor: Colors.red,
                                  margin: EdgeInsets.all(60),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 6,
                                ),
                              );
                            }
                            ;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          backgroundColor: Colors.orangeAccent,
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        child: const Text('Departed',
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Available Seats - 5",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewBusDetail()),
                );
              },
              child: const Icon(
                Icons.directions_bus_filled_outlined,
                size: 60,
                color: Colors.orange,
              ))
        ],
      ),
    );
  }
}

class BusListDetail2 extends StatelessWidget {
  const BusListDetail2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Route 35 to Glenferrie Station",
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: Colors.purple[300],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Arriving in 28mins",
                      style: TextStyle(
                        color: Colors.greenAccent[600],
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          backgroundColor: Colors.lightGreen,
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        child: const Text('Arrived',
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          backgroundColor: Colors.orangeAccent,
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        child: const Text('Departed',
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[20],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Available Seats - 35",
                    style: TextStyle(
                      color: Colors.lightGreen,
                    ),
                  ),
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewBusDetail()),
                );
              },
              child: const Icon(
                Icons.directions_bus_filled_outlined,
                size: 60,
                color: Colors.orange,
              ))
        ],
      ),
    );
  }
}

class BusListDetail3 extends StatelessWidget {
  const BusListDetail3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Route 35 to Parliament Station",
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: Colors.purple[300],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Arriving in 2mins",
                      style: TextStyle(
                        color: Colors.greenAccent[600],
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          backgroundColor: Colors.lightGreen,
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        child: const Text('Arrived',
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          backgroundColor: Colors.orangeAccent,
                        ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                        child: const Text('Departed',
                            style: TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Available Seats - 40",
                    style: TextStyle(
                      color: Colors.lightGreen,
                    ),
                  ),
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewBusDetail()),
                );
              },
              child: const Icon(
                Icons.directions_bus_filled_outlined,
                size: 60,
                color: Colors.orange,
              ))
        ],
      ),
    );
  }
}
