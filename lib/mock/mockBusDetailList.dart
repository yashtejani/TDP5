import 'package:project/model/bus_detail_list_item.dart';

class MockBusDetailList {
  static List<BustDetailListItem> FetchAny() {
    return [
      BustDetailListItem('11:30', 'Bus Stop no 1'),
      BustDetailListItem('11:30', 'Bus Stop no 2'),
      BustDetailListItem('11:50', 'Bus Stop no 3'),
      BustDetailListItem('13:00', 'Bus Stop no 4')
    ];
  }
}
