import 'package:flutter/cupertino.dart';

class BusListItem {
  final String time;
  final String busNo;

  BusListItem(this.time, this.busNo);

  Widget buildTime(BuildContext context) => Text(time);
  Widget buildBusNo(BuildContext context) => Text(busNo);
}
