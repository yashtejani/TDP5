import 'bus_stop.dart';

class BusDetail{
    String busNo;
    String image;
    String seats;
    List<BusStop> stops;
    BusDetail({required this.busNo, required this.image, required this.seats, required this.stops}); 
}