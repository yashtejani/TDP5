import 'package:project/model/bus_detail.dart';
import 'package:project/model/bus_stop.dart';

class MockBusDetail extends BusDetail {
  MockBusDetail({required super.busNo, required super.image, required super.seats, required super.stops});

  static BusDetail FetchAny() {
    return BusDetail(busNo: '1', image: '', seats: 'full', stops: <BusStop>[
      BusStop(time: '11:30', stopName: 'Stop A'),
      BusStop(time: '11:50', stopName: 'Stop B'),
      BusStop(time: '13:00', stopName: 'Stop C')
    ]);
  }
}
