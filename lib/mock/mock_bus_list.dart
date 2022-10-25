import 'package:project/model/bus_list_item.dart';

class MockBusList {
  static List<BusListItem> FetchAny() {
    return [
      BusListItem('11:30', 'Bus no 1'),
      BusListItem('11:30', 'Bus no 2'),
      BusListItem('11:50', 'Bus no 3'),
      BusListItem('13:00', 'Bus no 4')
    ];
  }
}
