import 'package:flutter/cupertino.dart';

class BustDetailListItem {
  final String time;
  final String busStop;

  BustDetailListItem(this.time, this.busStop);

  Widget buildTime(BuildContext context) => Text(time);
  Widget buildBusNo(BuildContext context) => Text(busStop);
}
