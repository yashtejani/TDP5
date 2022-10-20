import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../core/res/color.dart';

class BusList extends StatelessWidget {
  const BusList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('BusList'),
      elevation: 0,

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
        Text(
          "Next buses at Stop 103 Plenty Rd/High St",
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
        color: Colors.grey[200],
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
                    fontSize: 20,
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
                    "Crowded Level - Very Crowded",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Icon(
            Icons.directions_bus_filled_outlined,
            size: 60,
            color: Colors.orange,
          )
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
                    "Crowded Level - Plenty of Seats",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Icon(
            Icons.directions_bus_filled_outlined,
            size: 60,
            color: Colors.orange,
          )
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
        color: Colors.grey[200],
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
                  "Route 35 to Melbourne Central Station",
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
                    "Crowded Level - Plenty of Seats",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Icon(
            Icons.directions_bus_filled_outlined,
            size: 60,
            color: Colors.orange,
          )
        ],
      ),
    );
  }
}