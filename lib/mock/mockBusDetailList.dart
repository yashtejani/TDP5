import 'package:project/model/bus_detail_list_item.dart';

class MockBusDetailList {
  static List<BustDetailListItem> FetchAny() {
    return [
      BustDetailListItem('11:30', 'Bus Stop Richmond'),
      BustDetailListItem('11:30', 'Bus Stop Burnley'),
      BustDetailListItem('11:50', 'Bus Stop Hawthorn'),
      BustDetailListItem('13:00', 'Bus Stop Glenferrie')
    ];
  }
}
